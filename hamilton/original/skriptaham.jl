include("grapham.jl")
include("hamilton.jl")

M = [0 1 1 0 1 0 0 0 0 0; 
     1 0 1 1 1 0 0 0 0 0; 
     0 1 0 1 0 0 0 0 0 0;
     0 1 1 0 1 0 0 0 0 0;
     1 1 0 1 0 1 0 0 0 0;
     0 0 0 0 1 0 1 0 0 0;
     0 0 0 1 0 1 0 1 0 0;
     0 0 0 0 0 0 1 0 1 0;
     0 0 0 0 0 0 0 1 0 1;
     0 0 1 0 0 0 0 0 1 0;]

G = nonEmptyGraph(M);

path = zeros(Int, size(G.AdjMatrix, 1))
path[1] = 1
	
HamiltonCycle(G, path, 2)