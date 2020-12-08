input = File.readlines("input.txt").each {|line| line.strip!} #read in the file and strip out the whitespace
mins = [] #empty array for holding the minimum criteria
maxs = [] #empty array for holding the maximum criteria
criteria = [] #empty array for holding the search term crtieria
passwords = [] #empty array for holding the passwords
input.each do |line| #parse through each line of the input text and break them out into their component terms
	passwords.push(line.split(':')[1]) #store everything after the colon as the password
	firsthalf = line.split(':')[0] #store everything before the colon temporarily for further splits
	mins.push(firsthalf.split('-')[0].to_i) #store everything before the hyphen as the minimum
	secondhalf = firsthalf.split('-')[1] #store everything after the hyphen temporarily for further splits
	maxs.push(secondhalf.split(' ')[0].to_i) #store everything before the space as the max
	criteria.push(secondhalf.split(' ')[1]) #store everything after the space as the criteria
end

good = 0 #empty integer to keep track of the good passwords

passwords.each_with_index do |x,y| #this block has x as the password, and y as the integer that is the index
	result = x.scan(criteria[y]) #build an array of the istances of the character occuring in the password
	if result.length >= mins[y] && result.length <= maxs[y] #check to see if the length of that array falls within the min and max
		good += 1 #if so, increment by 1
	end
end
puts "There are #{good} good passwords per the old policy."

good = 0 		#zero out the good tracker for the second part

passwords.each_with_index do |x,y| #this block has x as the password, and y as the integer that is the index
	try1 = x[mins[y]] #grab the character that appears in the first position of the password
	try2 = x[maxs[y]] #grab the character that appears in teh second position of the password
	if (try1 == criteria[y]) ^ (try2 == criteria[y])
		good += 1
	end
end

puts "There are #{good} good passwords per the new policy"