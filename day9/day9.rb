input = File.readlines("input.txt").each {|line| line.strip!} #read in the file and strip out the whitespace
window = []					#empty array to contain the 25 elements of the sliding window
invalid = 0					#integer that will contain the invalid integer
25.times do |i|				#build the sliding window
	window << input[i].to_i
end
input.each_with_index do |x, i|
	if i < 25; next end 	#skip the preamble, we dont need to test that
	j = 0				#counter for stepping through the sliding window
	valid = false		#boolean to check whether we actually failed at the end
	until (j == 25) 	#do until we've gotten through the window
		find = x.to_i - window[j]		#set the search value to the difference between our number and the next element of the window
		if window.include?(find) == true	#check for that value in the window list
			valid = true		#set our boolean check to true
			break				#stop looping since we have a valid solution
		end
		j += 1					#increment the window position
	end
	if valid == false			#check to see if we failed
		puts "#{x.to_i} appears invalid."
		invalid = x.to_i		#set the invalid line to check against for part 2
		break				
	else
		window.delete_at(0)				#delete the first element of the window
		window << x.to_i				#add the next element of the window
	end
end
count = 0					#counter for tracking the total
window = []						#reset the window to store the continguous elements
input.each_with_index do |x, i|
	j = i
	until (count > invalid)
		window << input[j].to_i
		count = count + input[j].to_i
		if count == invalid
			puts "Found the weakness.  #{window.max} and #{window.min} in list. Answer is #{window.min + window.max}" 
			exit
		end
		j += 1
	end
	window = []
	count = 0
end