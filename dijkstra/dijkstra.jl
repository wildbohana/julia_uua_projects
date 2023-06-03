include("graf.jl")

function Dijkstra(graph::Graph, idStart::Int)
    broj_cvorova = length(graph.V)
    razdaljine = fill(Inf, broj_cvorova)
    razdaljine[idStart] = 0

    posjeceni = falses(broj_cvorova)

    for i in 1:broj_cvorova
        min_udaljenost = Inf
        min_cvor = -1

        # Pronalaženje sledećeg čvora s najmanjom udaljenošću
        for v in 1:broj_cvorova
            if !posjeceni[v] && razdaljine[v] < min_udaljenost
                min_udaljenost = razdaljine[v]
                min_cvor = v
            end
        end

        posjeceni[min_cvor] = true

        # Ažuriranje udaljenosti do susednih čvorova
        for v in 1:broj_cvorova
            if graph.AdjMatrix[min_cvor, v] > 0 && !posjeceni[v]
                nova_udaljenost = razdaljine[min_cvor] + graph.AdjMatrix[min_cvor, v]
                if nova_udaljenost < razdaljine[v]
                    razdaljine[v] = nova_udaljenost
                    graph.V[v].pred = min_cvor  # Ažuriranje atributa 'pred'
                end
            end
        end
    end

    return razdaljine, graph
end

AdjMatrix = [
    0.0 2.0 0.0 1.0 0.0 0.0 0.0 0.0 0.0 0.0;
    2.0 0.0 3.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0;
    0.0 3.0 0.0 0.0 4.0 0.0 0.0 0.0 0.0 0.0;
    1.0 0.0 0.0 0.0 2.0 0.0 0.0 0.0 0.0 0.0;
    0.0 0.0 4.0 2.0 0.0 5.0 0.0 0.0 0.0 0.0;
    0.0 0.0 0.0 0.0 5.0 0.0 3.0 0.0 0.0 7.0;
    0.0 0.0 0.0 0.0 0.0 3.0 0.0 1.0 0.0 0.0;
    0.0 0.0 0.0 0.0 0.0 0.0 1.0 0.0 4.0 0.0;
    0.0 0.0 0.0 0.0 0.0 0.0 0.0 4.0 0.0 3.0;
    0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 3.0 0.0
]

graph = nonEmptyGraph(AdjMatrix)

idStart = 1
razdaljine, graph = Dijkstra(graph, idStart)

println("Udaljenost $idStart. čvora od ostalih: ")
for (i, daljina) in enumerate(razdaljine)
    println("Čvor $i : $daljina")
end