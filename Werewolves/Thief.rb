require "./Role"
require "./Tool"

class Thief < Role
	
	include Tool
	
	def initialize no,role_list
		super(no)
		@role_list = role_list
	end	
	
	def change_role num_thief
		len = @role_list.length
		puts "Which role do you want? [1/2]"
		puts "1. #{@role_list[len-2].class}"
		choice = prompt("2. #{@role_list[len-1].class}").to_i
		while not (1..2)===choice
			choice = prompt("Type in 1 or 2.").to_i
		end
		@role_list[len-3+choice], @role_list[num_thief] = @role_list[num_thief], @role_list[len-3+choice]
		puts "You're a #{@role_list[num_thief].class} now."
	end
	
end