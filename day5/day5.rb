/~def collumn(num, path)
	if path == "B"

	elsif path == "F"

	end
end
~/

input = File.readlines("input.txt").each {|line| line.strip!} #read in the file and strip out the whitespace
rows = []
columns = []
seats = []

input.each do |x|
	pivot = 64
	max = 128
	min = 0
	y = x[0...6]
	y.each_char.with_index do |char, i|
		if char == "B"
			min = pivot
			pivot = (pivot + max) / 2
		elsif char == "F"
			max = pivot
			pivot = (pivot + min) / 2
		end
	end
	if x[6] == "B"
		rows.push(pivot)
	elsif x[6] == "F"
		rows.push(pivot - 1)
	end
end

input.each do |x|
	pivot = 4
	max = 8
	min = 0
	y = x[7...9]
	y.each_char.with_index do |char, i|
		if char == "R"
			min = pivot
			pivot = (pivot + max) / 2
		elsif char == "L"
			max = pivot
			pivot = (pivot + min) / 2
		end
	end
	if x[9] == "R"
		columns.push(pivot)
	elsif x[9] == "L"
		columns.push(pivot - 1)
	end
end

rows.each_with_index {|x, i| seats.push((x * 8) + columns[i])}

#rows.each {|x| puts x}
seats.sort!
seats.reverse!
num = seats[0] + 1

seats.each do |x|
	if num  - x != 1
		puts "Your seat is probably #{x + 1}"
	end 
	num = x
end

=begin
x = "BFFFBFFLLL"

pivot = 64
max = 128
min = 0
y = x[0...6]
y.each_char.with_index do |char, i|
	if char == "B"
		min = pivot
		pivot = (pivot + max) / 2
	elsif char == "F"
		max = pivot
		pivot = (pivot + min) / 2
	end
end
if x[6] == "B"
	puts "The row is #{pivot}"
elsif x[6] == "F"
	puts "The row is #{pivot - 1}"
end

pivot = 4
max = 8
min = 0
y = x[7...9]
y.each_char.with_index do |char, i|
	if char == "R"
		puts "Between #{pivot} and #{max}"
		min = pivot
		pivot = (pivot + max) / 2
		puts "Pivot point #{pivot}"
	elsif char == "L"
		puts "Between #{pivot} and #{min}"
		max = pivot
		pivot = (pivot + min) / 2
		puts "Pivot point #{pivot}"
	end
end
if x[9] == "R"
	puts "The collumn is #{pivot}"
elsif x[9] == "L"
	puts "The collumn is #{pivot -= 1}"
end
=end