# problem 7-2

def quick_sort(a, p, r, pivot_method)
#	print [p, r], "\n"
#	print a,"\n"
#	gets.chomp()
	if r-p > 1
		q, t = pivot_method.call(a, p, r)
		quick_sort(a, p, q, pivot_method)
		quick_sort(a, t, r, pivot_method)
	end
end

def get_pivot_three(a, p, r)
	pivot = a[r - 1]
	i = p - 1
	k = p - 1
	for j in (p...r-1)
	
#		print a, "\n"
#		puts "i: %d, j: %d, k: %d" % [i, j, k]
#		
#		print "> "
#		gets.chomp()
		
		if a[j] <= pivot
			k += 1
			a[j], a[k] = a[k], a[j]
			if a[k] < pivot
				i += 1
				a[k], a[i] = a[i], a[k]
			end
		end
		
	end
	
	a[k + 1],a[r - 1] = a[r - 1],a[k + 1]
	
	return i+1, k+2
end

def range_rand(a, b)
	return rand(b - a) + a
end

def rand_pivot(a, p, r)
	rd_pvt = range_rand(p, r)
	a[rd_pvt], a[r-1] = a[r-1], a[rd_pvt]
	return get_pivot_three(a, p, r)
end


def check(a, i1, i2)
	logic1 = true
	logic2 = true
	logic3 = true
	a[0...i1].each do |i|
		if i >= a[i1]
			logic1 = false		
		end
	end
	
	a[i1...i2].each do |i|
		if i != a[i1]
			logic2 = false
		end
	end	
	
	a[i2...a.length()].each do |i|
		if i <= a[i1]
			logic3 = false
		end
	end
	
	return (logic1 and logic2 and logic3)
end

#a = [5]*10
#
#puts get_pivot_mid(a, 0, a.length())

while true
	a = []
	for i in (0...15)
		a.push(rand(10))
	end

	puts "Before:"
	print a,"\n"
	quick_sort(a, 0, a.length(), method(:rand_pivot))
#	i1, i2 = rand_pivot(a, 0, a.length())
#	puts "%d, %d" % [i1, i2]
	puts "After:"
	print a, "\n"
	
	gets.chomp()
	
#	if not check(a, i1, i2)
#		gets.chomp()
#	end
		
end
