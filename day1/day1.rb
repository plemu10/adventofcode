input = File.readlines("input.txt").each {|line| line.strip!}		#read the file in and strip out the new line characters
lines = []															#empty array to hold integers because i cant figure out how to do in place
input.each {|line| lines.push(line.to_i)}							#convert the input into integers and add them to the new array
lines.each do |num|													#loop through each integer
		target = 2020 - num2										#establish the target we are looking for, because for any given number there is only 1 way to add up to 2020
		lines.each do |num2|										#loop through each integer a second time
			target2 = target - num2									#establish the second target
			if lines.find {|f| f == target2}						#look to see if the only available value exists in the list to complete the set
			puts "Found a pair: #{num} & #{num2} & #{target}"		#if it exists, proclaim that we identified a set and output those numbers
			puts num * num2 * target2								#multiply our set together and output the value
			break													#stop looping cause we gucci
		end
	end
end