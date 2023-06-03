mutable struct Cvor
    d::Float64
    pred::Int
    naziv::String
end

mutable struct Graph
    AdjMatrix::Array{Float64, 2}
    V::Array{Cvor, 1}
end

function printGraph(G::Graph)
    n = size(G.AdjMatrix, 1)
    for i in 1:n
        for j in 1:n
            print(" $(G.AdjMatrix[i, j])")
        end
        println()
    end
    for i in 1:n
        println("$(G.V[i].d) $(G.V[i].pred) $(G.V[i].naziv)")
    end
end

function emptyGraph(n::Int)
    AdjMatrix = fill(Inf, n, n)
    V = Array{Cvor}(undef, n)
    for i in 1:n
        V[i] = Cvor(Inf, 0, "")
    end
    return Graph(AdjMatrix, V)
end

function nonEmptyGraph(AdjMat::Array{Float64, 2})
    n = size(AdjMat, 1)
    V = Array{Cvor}(undef, n)
    for i in 1:n
        V[i] = Cvor(Inf, -1, "")
    end
    return Graph(copy(AdjMat), V)
end
