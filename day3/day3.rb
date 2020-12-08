input = File.readlines("input.txt").each {|line| line.strip!} #read in the file and strip out the whitespace
input.shift

trees = 0
slope = 3
gridsize = ((input.length * slope) / input[0].length) + 1
input.each do |x|
	y = x
	gridsize.times do |i|
			y = y + x
	end
	if y[slope] == "#"
		trees += 1
	end
	slope += 3
end

puts "Hit #{trees} number of trees on slope 3."

trees = 0
slope = 1
gridsize = ((input.length * slope) / input[0].length) + 1
input.each do |x|
	y = x
	gridsize.times do |i|
			y = y + x
	end
	if y[slope] == "#"
		trees += 1
	end
	slope += 1
end

puts "Hit #{trees} number of trees on slope 1."

trees = 0
slope = 5
gridsize = ((input.length * slope) / input[0].length) + 1
input.each do |x|
	y = x
	gridsize.times do |i|
			y = y + x
	end
	if y[slope] == "#"
		trees += 1
	end
	slope += 5
end

puts "Hit #{trees} number of trees on slope 5."

trees = 0
slope = 7
gridsize = ((input.length * slope) / input[0].length) + 1
input.each do |x|
	y = x
	gridsize.times do |i|
			y = y + x
	end
	if y[slope] == "#"
		trees += 1
	end
	slope += 7
end

puts "Hit #{trees} number of trees on slope 7."

trees = 0
slope = 1
input.shift
gridsize = ((input.length * slope) / input[0].length) + 1
input.each_with_index do |x,j|
	next if j % 2 == 1
	y = x
	gridsize.times do |i|
			y = y + x
	end
	if y[slope] == "#"
		trees += 1
	end
	slope += 1
end

puts "Hit #{trees} number of trees on last slope"