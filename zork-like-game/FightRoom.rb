require "./Tool"

module FightRoom
	
	def self.fight_room
		puts <<PARA
You're in a dark room now.
There is a evil dragon.
You will:
1. Fight with it.
2. Run away.
PARA
		next_move = Tool.prompt
		if next_move.include? "1"
			fight
		else
			Tool.dead "You're killed by the dragon when escaping.",1
		end
	end
	
	def self.fight
		puts <<PARA
You win!
PARA
	end
end
