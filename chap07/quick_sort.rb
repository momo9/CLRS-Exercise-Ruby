def quick_sort(a, p, r)
#	print [p, r], "\n"
#	print a,"\n"
#	gets.chomp()
	if r-p>1
		q = get_pivot(a, p, r)
		quick_sort(a, p, q)
		quick_sort(a, q, r)
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

def get_pivot_mid(a, p, r)
	i1 = p
	i2 = r-1
	q = (p+r)/2
	while true
		while i1<r and a[i1] <= a[q]
			i1 += 1
		end
		while i2>=p and a[i2] >= a[q]
			i2 -= 1
		end
		
		if i2<i1
			if i1<=q
				a[q],a[i1] = a[i1],a[q]
				return i1
			elsif i2>=q
				a[q],a[i2] = a[i2],a[q]
				return i2
			else
				return q
			end
		end
	end
end

a = []
for i in (0...10)
	a.push(rand(20))
end
#print a,"\n"
#quick_sort(a,0,a.length())
#print a
#a = [5]*10
puts get_pivot_mid(a,0,a.length())
print a,"\n"