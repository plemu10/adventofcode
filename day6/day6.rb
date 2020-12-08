input = File.readlines("input.txt").each {|line| line.strip!} #read in the file and strip out the whitespace
group = ""		#empty string for building each group
unique = []		#empty array for the unique elements per group
common = []
total = 0		#counter for tracking the total
group_size = 0  #counter for tracking group size

input.each do |x|		#for each line of input
	if x == ""			#check for a blank line which would indicate new group entry
		sub_common = []		#empty array for building the common answers within a group
		unique.push(group.split(//).uniq) #add the unique element to their own array
		y = group.split(//).unique			#set y to be the unique elements so we can iterate on them
		y.each do |z|						#for each unique element in y
			if group.count(z) == group_size	#see if the unique element appears in the current group the same nuber of times as the group size
				sub_common.push(z)		#if it does, add that character to the sub array
			end
		end
		common.push(sub_common)			#add the array of sub common to the main common list
		group = ""		#reset the group builder string
		group_size = 0	#reset the group size counter
	else
		group = group + x  #keep building the groups into a single line
		group_size += 1	#increment group size to keep track of the common answers later
	end
end

#have to repeat everything that happens when you find the blank line once more to account for the last item in the input
sub_common = []
unique.push(group.split(//).uniq)	#add the last group of unique elements
y = group.split(//).uniq
y.each do |z|
	if group.count(z) == group_size
		sub_common.push(z)
	end
end
common.push(sub_common)

unique.each {|x| total = total + x.length}  #add the length of each list in unique to the total
puts "#{total} unique" #print out the total
total = 0				#reset total counter for next case
common.each {|x| total = total + x.length}  #add the length of each list in common to the total
puts "#{total} same"  #print out the total