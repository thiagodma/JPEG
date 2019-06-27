function codes = getCode_v2(p,Ab)   %p é um vetor com as probabilidades dos termos do alfabeto
%Ab é um cell com os símbolos na ordem
%listada pelo vetor de probabilidades
i=1;
initialSymbol = Ab;
sSymbol = Ab;
sProb=p;
while(length(sProb)>1)
    [sProb,indeces] = sort(sProb,'descend'); %ordena de forma decrescente o vetor das probabilidades
    sSymbol = sSymbol(indeces);  %ordena de acordo a ordenação da linha acima o vetor dos simbolos
    
    newSymbol = strcat(sSymbol(length(sProb)-1),sSymbol(length(sProb)));
    newProb = sProb(length(sProb)-1) + sProb(length(sProb));
    
    sProb = sProb(1:length(sProb)-2);     %retira os symbolos que foram concatenados
    sSymbol = sSymbol(1:length(sSymbol)-2);
    
    sSymbol = [sSymbol;newSymbol];
    sProb = [sProb;newProb];
    
    newqSymbol(i,1) = newSymbol;
    newqProb(i,1) = newProb;
    i=i+1;
end
Symbols = [initialSymbol;newqSymbol];
for i=1:size(Symbols,1)
    Symbols{i} = sort(Symbols{i});
end
probs = [p;newqProb];

codes = cell(size(Symbols,1)-1,1);

[a,b] = compareStrings(Symbols);
a = sort(a);
b = sort(b);
for j=1:size(Symbols,1)
    if((length(Symbols{j}) == length(a)) & (Symbols{j} == a))
        codes{j} = '0';
    end
end

for j=1:size(Symbols,1)
    if((length(Symbols{j}) == length(b)) & (Symbols{j} == b))
        codes{j} = '1';
    end
end
Symbols = Symbols(1:size(Symbols,1)-1);
All_Symbols = Symbols;

for i=1:size(newqSymbol,1)-1
    [a,b] = compareStrings(Symbols);
    a = sort(a);
    b = sort(b);
    for j=1:length(Symbols)
        if((length(Symbols{j}) == length(a)) & (Symbols{j} == a))
            codes{j} = [codes{size(Symbols,1)} '0'];
        end
    end
    
    for j=1:length(Symbols)
        if((length(Symbols{j}) == length(b)) & (Symbols{j} == b))
            codes{j} = [codes{size(Symbols,1)} '1'];
        end
    end
    Symbols = Symbols(1:size(Symbols,1)-1);
end
codes = codes(1:size(Ab,1));
