require "./Role"
require "./Tool"

class Thief < Role
	
	include Tool
	
	def initialize no
		super(no)
	end	
	
	def change_role role_list
		
		len = role_list.length
		puts "Which role do you want? [1/2]"
		puts "1. #{role_list[len-2].class}"
		choice = prompt("2. #{role_list[len-1].class}").to_i
		while not (1..2)===choice
			choice = prompt("Type in 1 or 2.").to_i
		end
		new_no = len-3+choice
		role_list[new_no], role_list[@no] = role_list[@no], role_list[new_no]
		puts "You're a #{role_list[@no].class} now."
		role_list[@no].no, @no = @no, role_list[@no].no
		
		role_list[len-1].is_alive = false
		role_list[len-2].is_alive = false
	end
	
end