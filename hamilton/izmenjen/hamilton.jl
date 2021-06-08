function NextNode(G, path, position)
	while true
		path[position] = (path[position] + 1)%(size(G.AdjMatrix,1) + 1)
		if path[position] == 0
			return
		elseif G.AdjMatrix[path[position-1], path[position]] != 0
			j = 1
			while j != position
				if path[j] == path[position]
					break
				end
				
				j += 1
			end
			
			if j == position
				if position < size(G.AdjMatrix,1) || ((position == size(G.AdjMatrix,1)) && G.AdjMatrix[path[size(G.AdjMatrix,1)], path[1]] != 0)
					return
				end
			end
		end
	end
end

function HamiltonCycle(G, path, position)
	while true
		NextNode(G, path, position)
		if path[position] == 0
			return
		elseif position == size(G.AdjMatrix, 1)
			println("Solution: $(path)")
			ispisGradova(path, G)		# ovde pozoveš funkciju za ispis
		else
			HamiltonCycle(G, path, position + 1)
		end
	end
end

# cela nova funkcija
function ispisGradova(put, G)
	for i in 1:length(put)
		t=put[i]
		println("$(G.V[t].grad)")
	end
end
