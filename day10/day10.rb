input = File.readlines("input.txt").each {|line| line.strip!} #read in the file and strip out the whitespace
adapters = input.map{|x| x.to_i}		#convert the input to integers so math can be done
adapters.sort!						#sort the adapter list
gap1 = 1
gap3 = 1
p adapters.length

adapters.each_with_index do |x, i|
	if i == adapters.length - 1
		break
	end
	if (adapters[i + 1] - x) == 1
		gap1 += 1
	elsif (adapters[i + 1] - x) == 3
		gap3 += 1
	end
end	

puts "#{gap1 * gap3}"