function [a,b] = compareStrings(Symbols)

k=1;
count = 0;
for i=1:size(Symbols,1)
    a = intersect(Symbols{size(Symbols,1)},Symbols{size(Symbols,1)-k});
    if(not(isempty(a)))
    for j=1:size(Symbols,1)-1
        b = intersect(Symbols{size(Symbols,1)},Symbols{size(Symbols,1)-j});
        c = union(a,b);
        if(size(c,2) == size(Symbols{size(Symbols,1)},2))
        for z=1:size(Symbols{size(Symbols,1)},2)
            for x=1:size(Symbols{size(Symbols,1)},2)
                if(c(z) == Symbols{size(Symbols,1)}(x))
                    count = count+1;
                end
            end
        end
        
        if(count == size(Symbols{size(Symbols,1)},2))
            return;
        end
        end
    end
    end
    k=k+1;
end
end