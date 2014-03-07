require "./Role"
require "./Tool"

class Seer < Role
	
	include Tool
	
	def initialize no
		super(no)
	end
	
	def check role_list,player_num
		no = prompt("Choose the player you want to check [0..#{player_num-1}]:").to_i
		puts "No.#{no} is a #{role_list[no].class}"
	end
	
end