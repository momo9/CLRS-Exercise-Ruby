require "./Tool"
require "./Role"

class Hunter < Role
	
	include Tool
	
	attr_accessor :to_shoot
	
	def initialize no
		super(no)
		@to_shoot = nil
	end
	
	def kill
		lover = super()
		puts "="*30
		puts "The hunter is dying."
		@to_shoot = prompt("Choose a player to shoot.").to_i
		puts "="*30
		return lover
	end
end