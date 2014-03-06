require "./Role"
require "./Tool"

class Werewolf < Role

	include Tool
	
	def initialize no
		super no
	end
	
	def kill num_player
		choice = prompt "Do you want kill someone? [y/n]"
		if choice=="y"
			to_kill = prompt("Who do you want to kill? [0..#{num_player-1}]").to_i
			while not (0...num_player)===to_kill
				to_kill = prompt("Choose a player. [0..#{num_player-1}]").to_i
			end
			return to_kill
		else
			return nil
		end
	end

end