include("quickSortHoare.jl")
#dodaš unique
niz=unique(rand(1:1000,1,100))
#niz=[9 2 5 8 7 1 4 3 12 22 33 55 78 89 80 90 16 43 14 98 52 25 65 97 45 15 10 34 53 21] u slucaju da rand ne radi kako treba
display(niz)
println()
quickSortHoare!(niz)
display(niz)
