require "./FightRoom"
require "./DeadRoom"
require "./Character"
require "./Tool"

puts <<PARA
--------
Prelude
----------------------------------------------------
You wake up.
You feel a headache, and can't remember anything.
You try hard to recall your memory.
PARA

name = Tool.prompt "Who are you?"
c = Character.new name,100,1

puts <<PARA
There are two doors in this room.
Which would you like to open?
1. The left door
2. The right door
PARA

next_move = Tool.prompt

while next_move!="1" and next_move!="2"
	puts "I don't know what you mean."
	next_move = Tool.prompt
end

if next_move=="1"
	DeadRoom.dead_room	
else
	FightRoom.fight_room c	
end
