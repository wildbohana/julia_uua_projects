struct Student
    ime::String
    ocena::Int
    broj::Int
end

function heapsort!(A)
    global velicina
    build_max_heap!(A)
    for i = length(A):-1:2
        temp = A[1]
        A[1] = A[i]
        A[i] = temp
        velicina = velicina-1
        max_heapify!(A,1)
    end
end

function build_max_heap!(A)
    global velicina 
    velicina = length(A)
    for i = (Int(floor(length(A)/2))):-1:1
        max_heapify!(A,i)
    end
end

function max_heapify!(A,i)
    global velicina
    l = 2*i
    r = 2*i+1

    
    if l <= velicina && uporedi(A[l], A[i])
        largest = l
    else
        largest = i
    end
    if r <= velicina && uporedi(A[r], A[largest])
        largest = r
    end

    if largest != i
        temp = A[i]
        A[i] = A[largest]
        A[largest] = temp
        max_heapify!(A,largest)
    end
end


function uporedi(student1,student2)                                 
    if student1.ocena > student2.ocena
        return true
    elseif  student1.ocena==student2.ocena && student1.broj > student2.broj
        return true
    else 
        return false 
    end
end
