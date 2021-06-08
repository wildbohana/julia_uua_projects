function getMax(A, n)
	minIdx=1
	for i=2:n
		if A[i]>A[minIdx]
			minIdx=i
		end
	end
return A[minIdx]
end

function countSort!(A, n, exp)
	count=Int64[0 0 0 0 0 0 0 0 0 0]
	output=Array{Int64}(undef, n)
	i=1
	while i<=n
		count[Int(floor((A[i]/exp)))%10+1]+=1
		 i+=1
	end
	i=9
	while  i>0
		count[i]+=count[i+1]
		 i-=1
	end	
	for i in n:-1:1
		output[count[Int64(floor((A[i]/exp)))%10+1]]=A[i]
		count[Int64(floor((A[i]/exp)))%10+1]-=1
	end	
	for i in 1:n
		A[i]=output[i]
	end
end	

function radixSort!(A, n)
	m=getMax(A, n)
	exp=1
	while Int(floor(m/exp))>0
		countSort!(A, n, exp)
		exp*=10
	end
end

function ispisi(A)
	duzina=length(A)
	for i in 1:n
		print("$(A[i]) ")
	end
end

