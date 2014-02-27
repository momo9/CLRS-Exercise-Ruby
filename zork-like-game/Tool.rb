module Tool	
	def self.prompt *to_put
		puts to_put
		print "> "
		gets.chomp
	end
	
	def self.dead why, no
		puts "-"*15
		puts "Bad ending %02d" % no
		separ = "-"*(why.length+2)
		puts separ
		puts why
		puts "You're dead"
		puts separ
		Process.exit 0
	end
	
	def self.combat char1,act1,char2,act2
		basic_char1 = char1.basic_damage
		basic_char2 = char2.basic_damage
		
		# 1 stands for "attack"
		# 2 stands for "defend"
		# 3 stands for "sneak"
		if act1==1 and act2==2
			char2.get_hurt (basic_char1/2.0).to_i
		elsif act1==1 and act2==1
			char1.get_hurt basic_char2.to_i
			char2.get_hurt basic_char1.to_i
		elsif act1==1 and act2==3
			char1.get_hurt basic_char2.to_i
		elsif act1==2 and act2==3
			char2.get_hurt (basic_char1*2.0).to_i
		else
			puts "Nobody is hurt."
		end
	end
	
	def self.combat_interface char1,act1,char2,act2
		if act1==1
			combat char1,act1,char2,act2
		elsif act1==2
			if act2==1
				combat char2,act2,char1,act1
			else
				combat char1,act1,char2,act2
			end
		else
			if act2==3
				combat char1,act1,char2,act2
			else
				combat char2,act2,char1,act1
			end
		end
	end
end