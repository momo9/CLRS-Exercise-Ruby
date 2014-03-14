def quick_sort(a, p, r, pivot_method)
#	print [p, r], "\n"
#	print a,"\n"
#	gets.chomp()
	if r-p>1
		q = pivot_method.call(a, p, r)
		quick_sort(a, p, q, pivot_method)
		quick_sort(a, q, r, pivot_method)
	end
end

def get_pivot_three(a, p, r)
	pivot = a[r - 1]
	i = p - 1
	k = r - 1
	for j in (p...r-1)
	
#		print a, "\n"
#		puts "i: %d, j: %d, k: %d" % [i, j, k]
#		
#		print "> "
#		gets.chomp()

		if j == k
			break
		end
		
		
		if a[j] < pivot
			i += 1
			a[j], a[i] = a[i], a[j]
		elsif a[j] == pivot
			k -= 1
			a[j], a[k] = a[k], a[j]
		end
		
	end
#	a[i+1],a[r-1] = a[r-1],a[i+1]
#	return i + 1
end




def check(a,mid)
	logic1 = true
	logic2 = true
	a[0...mid].each do |i|
		if i>a[mid]
			logic1 = false		
		end
	end
	
	a[mid...a.length()].each do |i|
		if i<a[mid]
			logic2 = false
		end
	end
	return (logic1 and logic2)
end

#a = [5]*10
#
#puts get_pivot_mid(a, 0, a.length())

while true
	a = []
	for i in (0...15)
		a.push(rand(10))
	end

	print a,"\n"
#	quick_sort(a, 0, a.length(), method(:get_pivot_reverse))
	get_pivot_three(a, 0, a.length())
	print a
	
	gets.chomp()
end
