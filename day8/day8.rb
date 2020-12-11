def execute (instruction , pos, acc, input, used)
	y = instruction.split(' ')
	puts "Executing instruction #{pos + 1} #{instruction}."
	if used.include?({instruction=>pos}) == true
		puts "FOUND THE LOOP!  Accumulator is #{acc}"
		exit
	end 
	if y[0] == "nop" 
		used << {instruction => pos}
		pos += 1
		puts used.last
		execute(input[pos], pos, acc, input, used)
	elsif y[0] == "acc" 
		used << {instruction => pos}
		acc = acc + y[1].to_i
		puts "Accumulator is now #{acc}"
		pos += 1
		execute(input[pos], pos, acc, input, used)
	elsif y[0] == "jmp"
		used << {instruction => pos}
		pos = pos + y[1].to_i
		execute(input[pos], pos, acc, input, used)
	end
end
used = []
accumulator = 0
position = 0
execute(input[0], position, accumulator, input, used)