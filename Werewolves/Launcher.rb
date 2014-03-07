require "./Tool"
require "./Civilian"
require "./Seer"
require "./Witch"
require "./Hunter"
require "./Cupid"
require "./Bodyguard"
require "./Thief"
require "./Werewolf"

include Tool

class Launcher
	
	include Tool
	
	def initialize
#		@player_num = prompt("Number of players:").to_i
		@player_num = 10
		
		@werewolf_num = @player_num/4+1
		@civilian_num = @player_num+2-6-@werewolf_num
		
		puts "Number of players: #{@player_num}"
		puts "Number of werewolves: #{@werewolf_num}"
		puts "Number of civilians: #{@civilian_num}"
		
	end
	
	def first_night
				
		# thief
		puts "="*30
		puts "It's getting dark."
		puts "="*30
		puts "The thief wake up."		
		if role_valid @thief
			@thief.change_role @role_list
		else
			puts "There is no thief."
		end
		
		# cupid

		puts "="*30
		puts "The Cupid wake up."
		lover_a = nil
		lover_b = nil
		if @cupid.is_alive
			lover_a, lover_b = @cupid.make_fall_in_love @role_list
		else
			puts "There is no Cupid."
		end
		
		# lover

		puts "="*30
		if lover_a==nil
			puts "There is no lover."
		else
			puts "Player #{lover_a} and player #{lover_b} are lovers."
		end
		
	end
		
	
	def night
		
		# seer
		
		puts "="*30
		if @seer.is_alive
			puts "The seer wake up."
			@seer.check @role_list, @player_num
		else
			puts "There is no seer."
		end
		
		# werewolf

		puts "="*30
		no_wolf = alive_werewolf
#		puts no_wolf		
		
		if no_wolf==nil
			puts "There's no werewolves."
			return nil
		else
			puts "The werewolves wake up."
			print "Werewolves are: "
			@werewolves.each do |w|
				print w.no," "
			end
			puts
			killed = @role_list[no_wolf].kill_player @player_num	
		end
		
		# witch

		puts "="*30
		if @witch.is_alive
			puts "The witch wake up."
			saved,poisoned = @witch.skill killed
		else
			puts "There's no witch."
		end

		# bodyguard
		
		puts "="*30
		if @bodyguard.is_alive
			puts "The bodyguard wake up."
			guarded = @bodyguard.guard @player_num
		else
			puts "There's no bodyguard."
		end
		
		# judge

		puts "="*30
		if killed==nil
			if poisoned==nil
				puts "It's a peaceful night."
			else
				kill poisoned
			end
		else
			if saved!=nil
				puts "It's a peaceful night."					
			else
				if guarded==killed
					puts "It's a peaceful night."
				else
					kill killed					
				end
				unless poisoned==nil
					kill poisoned
				end
			end
		end
		
		unless @hunter.to_shoot==nil
			kill @hunter.to_shoot
			@hunter.to_shoot = nil
		end
		
		return alive_werewolf
		
	end
	
	
	def day
		
		puts "="*30
		puts "It's morning."
		choice = prompt("Put a player to die.").to_i
		puts "="*30
		kill choice

		unless @hunter.to_shoot==nil
			kill @hunter.to_shoot
			@hunter.to_shoot = nil
		end
		
		return alive_werewolf
		
	end
	

	def rand_role # determine roles of the players
		
		@seer = Seer.new(0)
		@witch = Witch.new(1)
		@hunter = Hunter.new(2)
		@cupid = Cupid.new(3)
		@bodyguard = Bodyguard.new(4)
		@thief = Thief.new(5)
		
		@werewolves = []
		(0...@werewolf_num).each do |i|
			@werewolves<< Werewolf.new(i+6)
		end
		
		@civilians = []

		(0...@civilian_num).each do |i|
			@civilians<< Civilian.new(i+6+@werewolf_num)
		end
		
		
		@role_list = [@seer,
					@witch,
					@hunter,
					@cupid,
					@bodyguard,
					@thief]	+ @werewolves + @civilians;
		
		
		# now, all the roles are allocated, begin to random the order

		(0...@role_list.length).each do |i|
			r = rand(i...@role_list.length)
			@role_list[i],@role_list[r] = @role_list[r],@role_list[i]
			@role_list[i].no = i
			@role_list[r].no = r
		end
		
	end

	def print_role
		puts "="*30
		(0...@role_list.length).each do |i|
			puts "#{i}: #{@role_list[i].class}, #{@role_list[i].is_alive}"
		end
		puts "="*30
	end

	private		
	
	def role_valid role
		return (role.no!=@player_num and role.no!=@player_num+1)
	end
	
	def alive_werewolf

		@werewolves.each do |w|
			if w.is_alive
				return w.no
			end
		end
		
		return nil
		
	end
	
	def kill no
		lover = @role_list[no].kill
		puts "Player #{no} is killed."
		unless lover==nil
			@role_list[lover].kill
			puts "Player #{lover} dies for player #{no}."
		end			
	end
	
end

l = Launcher.new

repeat_game = true

while repeat_game

	l.rand_role
	
	l.print_role
	
	l.first_night
	
	continue = true
	
	while continue

		puts "="*30
		puts "It's getting dark."
		puts "="*30
		
		if l.night == nil
			puts "Game over."
			break
		end
		
		if l.day == nil
			puts "Game over."
			break
		end
		
		l.print_role
	
		choice = prompt "Is game over? [y/n]"
		continue = (choice=="n")
		
	end
	
	l.print_role	

	choice = prompt "Start a new game? [y/n]"
	repeat_game = (choice=="y")
	
end
