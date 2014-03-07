require "./Role"
require "./Tool"

class Witch < Role
	
	include Tool
	
	def initialize(no)
		super(no)
		@antidote = true
		@poison = true
	end
	
	# save or poison
	def skill num_killed #return the player saved and poisoned
		num_saved = save(num_killed)
		[num_saved, poison(num_saved)]
	end
	
	private
	
	def save num_killed
		if num_killed==nil
			puts "It's a peaceful night."
			return nil
		end
		if num_killed==@no
			puts "You're killed."
			return nil
		end
		choice = prompt "No.#{num_killed} player is killed. Will you save him? [y/n]"
		if choice=="y"
			if @antidote
				@antidote = false
				return num_killed				
			else
				puts "You don't have antidote."
				return nil
			end
		else
			puts "You didn't use the antidote."
			return nil
		end
	end
	
	def poison num_saved
		choice = prompt("Do you want to poison a player? [y/n]")
		num_poisoned = prompt("Which one?").to_i
		if choice=="y" and num_saved==nil # when choose to use poison and haven't save any one
			if @poison
				@poison = false
				return num_poisoned
			else
				puts "You don't have poison."
				return nil
			end
		else
			puts "You poison nobody."
			return nil
		end
	end
	
end