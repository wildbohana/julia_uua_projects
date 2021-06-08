include("floydwarshall.jl")
include("graph.jl")

M = [0 1 4 0 5 0 4 1 2 6;
     4 0 4 5 0 0 3 4 4 4;
     0 5 0 -2 5 5 1 3 2 2;
     0 1 5 0 6 3 1 0 4 0;
     0 2 1 1 0 3 2 5 1 0;
     3 2 0 1 1 0 1 4 2 2;
     3 0 0 0 3 2 0 5 6 1;
     2 1 4 0 0 0 3 0 2 6;
     0 4 0 2 4 4 2 1 0 5;
     0 0 3 2 0 0 1 2 3 0]	
G=nonEmptyGraph(M)
udaljenost,sledeci = FloydWarshall(G)

if length(udaljenost) !=0
	println("Udaljenost svih čvorova : ")
	display(udaljenost)
	println()
	
	println("Prethodnici svih čvorova: ")
	display(sledeci)
	println()
	
	a=3
	b=5
	println("Udaljenost izmedju $a. i $b. elementa:")
	display(Path(sledeci,a,b))
end
