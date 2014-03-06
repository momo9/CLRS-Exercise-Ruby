require "./Role"
require "./Tool"

class Seer < Role
	
	include Tool
	
	def initialize no,role_list
		super(no)
		@role_list = role_list
	end
	
	def check
		no = prompt("Choose the player you want to check:").to_i
		puts "No.#{no} is a #{@role_list[no].class}"
	end
	
end