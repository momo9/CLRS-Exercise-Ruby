require "./Tool"
require "./Role"

class Hunter < Role
	
	include Tool
	
	def initialize no
		super no
	end
	
	def kill
		super()
		prompt("Choose a player to shoot.").to_i
	end
end