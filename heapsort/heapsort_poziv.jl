include("heap.jl")

studenti = Student[]

push!(studenti, Student("M", 7, 99))
push!(studenti, Student("A",7, 55))
push!(studenti, Student("P", 888,5))
push!(studenti, Student("t", 900,5))

heapsort!(studenti)
for i = 1:length(studenti)
    println("$i. $(studenti[i].ime) $(studenti[i].ocena)")
end
