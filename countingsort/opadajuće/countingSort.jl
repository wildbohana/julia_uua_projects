# opadajuće
function countingSort(niz)
	n=length(niz)
	
	niz2=[]
	for i=1:100
		push!(niz2, 0)		# count
	end
	
	for i=1:n
		niz2[niz[i]]+=1
	end
	
	i=99
	while i>0
		niz2[i]+=niz2[i+1]
		i-=1
	end
	
	niz1=[]
	for i=1:n
		push!(niz1, 0)		# output
	end
	
	for i in 1:n
		niz1[niz2[niz[i]]] = niz[i]
		niz2[niz[i]]-=1
		i-=1
	end
	
	for i=1:n
		niz[i]=niz1[i]
	end
end
