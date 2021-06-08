function quickSortHoare!(niz)
    quickSortStep!(niz, 1, length(niz));
end

function quickSortStep!(niz, pocetak, kraj)
    if pocetak < kraj
        q=partitionHoare!(niz, pocetak, kraj);
        quickSortStep!(niz, pocetak, q);
        quickSortStep!(niz, q+1, kraj);
    end
end

function partitionHoare!(niz, pocetak, kraj)
    pivot = niz[pocetak]
    i = pocetak
    j = kraj

    while true
        while (niz[i] < pivot)
            i = i+1
            #println("i=",i)
        end
        while (niz[j] > pivot)
            j = j-1
            #println("j=",j)
        end
        if i >= j
            return j
	end
        niz[[i j]]=niz[[j i]]
    end
end
