require "./Tool"
require "./Role"

class Bodyguard < Role
	
	include Tool
	
	def initialize no
		super(no)
		@last_time = nil
	end
	
	def guard
		to_guard = prompt("Choose a player to guard:").to_i
		while to_guard==@last_time
			to_guard = prompt("Cannot guard the same player!").to_i
		end
		@last_time = to_guard
	end
end