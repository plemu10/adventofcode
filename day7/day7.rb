=begin
def find_rules(adjective, color, rules, id, good_rules, sub_total)
	rules.each_with_index do |x, i|
		if x[0] == adjective && x[1] == color
			id.push(i)
			sub_total += 1
			puts "Found rule at line #{i + 1} with #{adjective} #{color}, #{sub_total} colors in current run"
			x.each_with_index do |y, j|
				if j < 5
					next
				end
				if x[j + 2] == "bags," || x[j + 2] == "bag,"
					puts "Now looking for #{y} and #{x[j + 1]}"
					if y == "shiny" && x[j + 1] == "gold"
						puts "Found shiny gold!!!"
						good_rules = good_rules + sub_total
						break
					end
					find_rules(y, x[j + 1], rules, id, good_rules, sub_total)
				elsif x[j + 2] == "bags."
					puts "Now looking for #{y} and #{x[j + 1]}"
					if y == "shiny" && x[j + 1] == "gold"
						puts "Found shiny gold!!!"
						good_rules = good_rules + sub_total
						break
					end
					find_rules(y, x[j + 1], rules, id, good_rules, sub_total)
					sub_total -= 1
					break
				end
			end
			#p id
		end
	end
	#id.each {|x| rules.delete_at(x)}
end
=end

class rule
	attr_accessor :name, :sub_list, :checked, :has_gold
end

input = File.readlines("input.txt").each {|line| line.strip!} #read in the file and strip out the whitespace
rules = input.map {|x| x.split(' ')} # build an array where each element is a list which is the rule split on the whitespace
good_rules = 0 			#counter for the rules that meet our condition
sub_total = 0
id = []						#empty array for containing our rules to delete from the original rules
adjective = rules[0][0]
color = rules[0][1]

=begin
#eliminate all rules which contain no other bags, they are not needed
rules.each_with_index do |x, i|
	if x[5] == "other"		#the 6th item in a line being "other" indicates a useless rule
		id.push(i)			#track its position with the id list
	end
end

id.each do |x|
	rules.delete_at(x)		#delete the tracked positions from the list of rules
end
=end
id = []			#reset the id list

find_rules(adjective, color, rules, id, good_rules, sub_total)
