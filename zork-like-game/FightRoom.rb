require "./Tool"
require "./Character"

module FightRoom
	
	def self.fight_room char
		puts <<PARA
#{"-"*20}
Fight Room
#{"-"*20}
You're in a dark room now.
There is a evil dragon.
You will:
1. Fight with it.
2. Run away.
PARA
		next_move = Tool.prompt
		if next_move.include? "1"
			fight char
		else
			Tool.dead "You're killed by the dragon when escaping.",1
		end
	end
	
	def self.fight c
		
		chen = Character.new "Dragon",100,2
	
		while c.is_alive and chen.is_alive
			puts <<PARA
"What would you do?"
1. Attack
2. Defend
3. Sneak
PARA
			next_step = Tool.prompt
			while next_step!="1" and next_step!="2" and next_step!="3"
				next_step = Tool.prompt "I don't know what you mean."				
			end
			act1 = next_step.to_i
			act2 = chen.rand_action
			Tool.combat_interface c,act1,chen,act2	
		end
		
		if chen.is_alive
			Tool.dead "After intentive fights, you are killed by the dragon.",2
		else
			puts <<PARA
----------
Epilogue
-------------------------------------------------------
After intentive fights, the dragon lies down and dies.
You kill it.
You win!
-------------------------------------------------------
PARA
			"You win!"
			Process.exit 0
		end
	end
end
