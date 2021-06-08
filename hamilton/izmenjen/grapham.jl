mutable struct Cvor			# moraš ovo menjati (dodati celu strukturu Cvor)
    color::Char
    d::Int
    pred::Int
    grad::String
end

mutable struct graph
   AdjMatrix::Array{Int, 2}
   V::Array{Cvor, 1}
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
     println("$(G.V[i])")		# ovde ti je nebitno šta stoji, ionako nećeš koristiti ovo
  end
end

function emptyGraph(n)
   AdjMatrix = zeros(n, n)
   V = Array{Cvor}(undef, n)		# ovde kod {} stavi Cvor umesto Int
   for i in 1:n
     V[i] = Cvor('W', 0, 0, "")		# ovo moraš zameniti
   end
   return graph(AdjMatrix, V)
end

function nonEmptyGraph(AdjMat)
   n = size(AdjMat, 1)
   V = Array{Cvor}(undef, n)		# i ovde kod {} stavi Cvor umesto Int
   for i in 1:n
     V[i] = Cvor('W', 0, 0, "")		# i ovo moraš zameniti
   end
   return graph(copy(AdjMat), V)
end
