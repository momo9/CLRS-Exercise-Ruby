require "./FightRoom"
require "./Character"
require "./Tool"
#FightRoom.fight_room

name = Tool.prompt "What is your name?"
c = Character.new name,100,1
chen = Character.new "CWG",100,2


while c.is_alive and chen.is_alive
	next_step = Tool.prompt "What would you do?"
	act1 = next_step.to_i
	act2 = chen.rand_action
	Tool.combat_interface c,act1,chen,act2	
end

