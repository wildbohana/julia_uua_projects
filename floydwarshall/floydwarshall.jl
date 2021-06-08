function FloydWarshall(G)
	udaljenost = zeros(Int, length(G.V), length(G.V))
	prethodni = zeros(Int, length(G.V), length(G.V))

	for i in 1:length(G.V)
		for j in 1:length(G.V)
			prethodni[i,j]=-1
			udaljenost[i,j]=typemax(Int)
		end
	end
	
	for i in 1:length(G.V)
		udaljenost[i,i]=0
		prethodni[i,i]=i
	end
	
	for i in 1:length(G.V)
		for j in findall(G.AdjMatrix[i,:].!=0)
			udaljenost[i,j]=G.AdjMatrix[i,j]
			prethodni[i,j]=i
		end
	end 
	
	for k in 1:length(G.V)
		for i in 1:length(G.V)
			for j in 1:length(G.V)
				if udaljenost[i,k]!=typemax(Int) && udaljenost[k,j]!=typemax(Int) && (udaljenost[i,j] > udaljenost[i,k]+udaljenost[k,j])		
					udaljenost[i,j]=udaljenost[i,k]+udaljenost[k,j]
					prethodni[i,j]=prethodni[k,j]
				end
				
			end
			if udaljenost[i,i]<0
				println("Negativan ciklus")
				return [], []
			end
		end
	end
	return udaljenost,prethodni
end

function Path(prethodni,i,j)
	if prethodni[i,j]==-1
		return []
	end
	path=[j]
	while j!=i
		j=prethodni[i,j]
		push!(path,j)
	end
	return reverse(path)
end
