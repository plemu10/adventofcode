=begin
class Creds
	#Reader and Accessor attributes
	attr_reader :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid, :cid 

	def initialize (cred_byr, cred_iyr, cred_eyr, cred_hgt, cred_hcl, cred_ecl, cred_pid, cred_cid)
		@byr = cred_byr
		@iyr = cred_iyr
		@eyr = cred_eyr
		@hgt = cred_hgt
		@hcl = cred_hcl
		@ecl = cred_ecl
		@pid = cred_pid
		@cid = cred_cid
	end
	/~#This makes the class enumerable based on the priority.  Remember this shit right here.
	def <=> (other)
		self.priority <=> other.priority
	end~/
end
=end

input = File.readlines("input.txt").each {|line| line.strip!} #read in the file and strip out the whitespace

creds = []
new_cred = "" #empty string to build single line passports
valid = 0	#counter for valid passports
north = 0
regular = 0
invalid = 0

input.each do |x|		#for each line of input
	if x != ""			#check for a blank line which would indicate new passport entry
		new_cred = new_cred + " " + x  #keep building the passport into a single line
	else				#once we encounter a new line, process the passport we know we just read in
		fields = new_cred.split #create a new array splitting the line on whitespace to get key value pairs
		if fields.length == 8 #if there are 8 key value pairs, we know we have enough fields to have a valid passport
			valid += 1		#increment our valid counter
			regular += 1
			#puts "Valid passports with fields #{fields}"
		elsif fields.length == 7	#if there are 7 fields, then we MAY have a valid passport
			#puts "Passport with 7 fields: #{fields}"
			all_fields = []
			fields.each do |y|
				cid = y.split(':') #split each individual pair on the colon
				cid.each {|z| all_fields.push(z)} #add those to a new array called all fields
			end
			if all_fields.include?('cid') == true   #if cid does not exist in the array, increment the valid counter 
				invalid += 1
			else
				valid += 1
			end
		elsif fields.length < 7
			#invalid += 1
		end
		creds.push(fields)
		new_cred = ""		#reset the single line builder for the next passport
	end
end

fields = new_cred.split #create a new array splitting the line on whitespace to get key value pairs
	if fields.length == 8 #if there are 8 key value pairs, we know we have enough fields to have a valid passport
		valid += 1		#increment our valid counter
		regular += 1
		#puts "Valid passports with fields #{fields}"
	elsif fields.length == 7	#if there are 7 fields, then we MAY have a valid passport
		#puts "Passport with 7 fields: #{fields}"
		all_fields = []
		fields.each do |y|
			cid = y.split(':') #split each individual pair on the colon
			cid.each {|z| all_fields.push(z)} #add those to a new array called all fields
		end
		if all_fields.include?('cid') == true   #if cid does not exist in the array, increment the valid counter 
			invalid += 1
		else
			valid += 1
		end
	elsif fields.length < 7
		#invalid += 1
	end
	creds.push(fields)

puts "#{valid} passports"
puts "#{north} north pole credentials"
puts "#{regular} normal passports"
puts "#{creds.length} number of entries"
puts "#{invalid} invalid passports"



p new_cred