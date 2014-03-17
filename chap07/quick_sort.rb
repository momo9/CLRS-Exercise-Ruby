# exercise in 7.1

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

def get_pivot(a, p, r)
	pivot = a[r-1]
	i = p-1
	for j in (p...r-1)
		if a[j]<=pivot
			i += 1
			a[j],a[i] = a[i],a[j]
		end
	end
	a[i+1],a[r-1] = a[r-1],a[i+1]
	return i+1
end

def get_pivot_reverse(a, p, r)
	pivot = a[r-1]
	i = p-1
	for j in (p...r-1)
		if a[j]>=pivot
			i += 1
			a[j],a[i] = a[i],a[j]
		end
	end
	a[i+1],a[r-1] = a[r-1],a[i+1]
	return i+1
end


def get_pivot_bi(a, p, r)
	i1 = p
	i2 = r-2
	pivot = a[r-1]
	while true
		while i1<r-1 and a[i1] <= pivot
			i1 += 1
		end
		while i2>=p and a[i2] >= pivot
			i2 -= 1
		end
		
		if i2<i1
			a[i1],a[r-1] = a[r-1],a[i1]
			return i1
		else
			a[i1],a[i2] = a[i2],a[i1]
		end
	end
end

def get_pivot_mid(a, p, r)
	# i1 and i2 should move at the same time
	i1 = p
	i2 = r-2
	pivot = a[r-1]
	while true
		while true
			if  i1 < r-1 and a[i1] <= pivot
				i1 += 1
			end
			if i2 >= p and a[i2] >= pivot
				i2 -= 1
			end
			
			if i2<i1
				a[i1],a[r-1] = a[r-1],a[i1]
				return i1
			end
			
			if a[i1] > pivot and a[i2] < pivot
				a[i1],a[i2] = a[i2],a[i1]				
			end
		end
	end
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

a = [5]*10

puts get_pivot_mid(a, 0, a.length())

while true
	a = []
	for i in (0...15)
		a.push(rand(20))
	end

	print a,"\n"
	quick_sort(a, 0, a.length(), method(:get_pivot_reverse))
	print a
	
	gets.chomp()
end
