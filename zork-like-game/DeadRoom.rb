require "./Tool"

module DeadRoom
	
	def self.dead_room
		puts <<PARA
----------
Dead Room
------------------------------
This is a dead room.
You catch the smell of death.
------------------------------
PARA
		Tool.dead "You cannot bear it.",3
	end
	
end