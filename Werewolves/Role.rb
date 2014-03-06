class Role
	
	attr_reader :is_alive
	attr_accessor :lover
	attr_accessor :no
	
	def initialize no
		@is_alive = true
		@lover = nil
		@game_no = no
	end
	
	def kill	# return lover of the killed player
		@is_alive = false
		@lover
	end
		
end