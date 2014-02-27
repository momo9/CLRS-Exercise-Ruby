class Character
	def initialize name,hp,no
		@name, @hp, @no = name,hp,no
		@alive = true
		@rand_gen = Random.new(Time.now.to_i+no)
	end
	
	def rand_action
		r = @rand_gen.rand(1..3)
		if r==1
			puts "#{@name} attacks."
		elsif r==2
			puts "#{@name} defends."
		else
			puts "#{@name} sneaks."
		end
		r
	end
	
	def is_alive
		@alive
	end
	
	def get_hurt harm
		@hp -= harm
		puts "#{@name} gets #{harm} harm."
		if @hp <= 0
			@alive = false
			puts "#{@name} is dead."
		else
			puts "#{@name} is still alive. He has #{@hp} HP."
		end
	end
	
	def basic_damage
		@rand_gen.rand(5.0...20.0)
	end
end