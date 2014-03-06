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
		@player_num = prompt("Number of players:").to_i
		@werewolf_num = @player_num/4+1
		@civilian_num = @player_num+2-6-@werewolf_num
		
		puts "Number of players: #{@player_num}"
		puts "Number of werewolves: #{@werewolf_num}"
		puts "Number of civilians: #{@civilian_num}"

		rand_role
		
	end
	
		
	
	def test
		print_role
	end
	
	private

	def rand_role # determine roles of the players
		
		@seer = Seer.new(0,@role_list)
		@witch = Witch.new(1)
		@hunter = Hunter.new(2)
		@cupid = Cupid.new(3,@role_list)
		@bodyguard = Bodyguard.new(4)
		@thief = Thief.new(5,@role_list)
		
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
		(0...@role_list.length).each do |i|
			puts "#{i}: #{@role_list[i].class}, #{@role_list[i].no}"
		end
		puts
	end
	
end

l = Launcher.new

repeat_game = true

while repeat_game
	choice = prompt "Start a new game? [y/n]"
	repeat_game = (choice=="y")
end
