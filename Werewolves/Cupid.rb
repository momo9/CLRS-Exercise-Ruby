require "./Tool"
require "./Role"

class Cupid < Role
	
	include Tool
	
	def initialize no
		super(no)
	end
	
	def make_fall_in_love role_list
		lover_a = prompt("Choose the first lover.").to_i
		lover_b = prompt("Choose the second lover.").to_i
		role_list[lover_a].lover = lover_b
		role_list[lover_b].lover = lover_a
		[lover_a, lover_b]
	end
end