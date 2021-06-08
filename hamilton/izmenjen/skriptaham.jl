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


# dodaješ imena gradova ovde
gradovi=[]
push!(gradovi, Cvor('W', 0, 0, "Beograd"))
push!(gradovi, Cvor('W', 0, 0, "Novi Sad"))
push!(gradovi, Cvor('W', 0, 0, "Niš"))
push!(gradovi, Cvor('W', 0, 0, "Višegrad"))
push!(gradovi, Cvor('W', 0, 0, "Kraljevo"))
push!(gradovi, Cvor('W', 0, 0, "Kruševac"))
push!(gradovi, Cvor('W', 0, 0, "Bečej"))
push!(gradovi, Cvor('W', 0, 0, "Kovin"))
push!(gradovi, Cvor('W', 0, 0, "Subotica"))
push!(gradovi, Cvor('W', 0, 0, "Sombor"))
G.V=gradovi		# ne zaboravi ovo

path = zeros(Int, size(G.AdjMatrix, 1))
path[1] = 1

HamiltonCycle(G, path, 2)
