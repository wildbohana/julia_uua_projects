mutable struct graph
   AdjMatrix::Array{Int, 2}
   V::Array{Int, 1}
end

function printGraph(G)
  n = size(G.AdjMatrix, 1)
  for i in 1:n
    for j in 1:n
      print(" $(G.AdjMatrix[i,j])")
    end
  println()
  end
  for i in 1:n
     println("$(G.V[i])")
  end
end

function emptyGraph(n)
   AdjMatrix = zeros(n, n)
   V = Array{Int}(undef, n)
   for i in 1:n
     V[i] = i
   end
   return graph(AdjMatrix, V)
end

function nonEmptyGraph(AdjMat)
   n = size(AdjMat, 1)
   V = Array{Int}(undef, n)
   for i in 1:n
     V[i] = i
   end
   return graph(copy(AdjMat), V)
end
