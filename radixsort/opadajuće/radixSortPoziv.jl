include("radixSortFunkcija.jl")

A=rand(1:100, 15)
n=length(A)

print("Niz prije sorta: ")
ispisi(A)

radixSort!(A, n)

print("\n\nNiz poslije sorta: ")
ispisi(A)
