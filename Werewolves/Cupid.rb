require "./Tool"
require "./Role"

class Cupid < Role
	
	include Tool
	
	def initialize no,role_list
		super(no)
		@role_list = role_list
	end
	
	def make_fall_in_love
		lover_a = prompt("Choose the first lover.").to_i
		lover_b = prompt("Choose the second lover.").to_i
		@role_list[lover_a].lover = lover_b
		@role_list[lover_b].lover = lover_a
	end
end