function dmsg = decodifica_v2(Ab,codes, bitstream)

nbits = zeros(length(Ab),1);

for i=1:length(Ab)
    nbits(i,1) = length(codes{i});
end

Lmax = max(nbits);

table = [];
first = [];
for i=1:Lmax
first = [first '0'];
end

table_aux = repmat('0',2^Lmax,Lmax);

symbols = zeros(2^Lmax,1);
sizes = zeros(2^Lmax,1);
aux = permn([0;1],Lmax);
table_aux = int2str(aux);  
table = [];
for i=1:3:size(table_aux,2)
   table = [table table_aux(:,i)];
end

for j=1:length(Ab)
   n = nbits(j);
   x = table(:,1:n);
   x = bin2dec(x);
   y = bin2dec(codes{j});
   x = (x==y);
   go =(x==1);
   go = find(go);
   symbols(go) = Ab{j};
   sizes(go) = n;
end  
% table montada
atual = 1;
N = length(bitstream);
dmsg = ones(1,N)*(1.5);
i=1;

while(N-atual >= Lmax)
        
        secBitstream = bitstream(atual:(Lmax+atual-1));
        indice = bin2dec(secBitstream) + 1;
        dmsg(i) = symbols(indice);
       atual = atual + sizes(indice); 
       i = i+1;
end
bitstream = bitstream(atual:end);

while(~isempty(bitstream))
   a = 0;
   j=1;
    while(a ~= 1)
        
        if(nbits(j) <= length(bitstream))
            secBitstream = bitstream(1:nbits(j));
        else
            secBitstream = ones(size(bitstream))*2;
        end
            
        if ((length(secBitstream) == length(codes{j}))&(secBitstream == codes{j}))
            dmsg(i) = Ab{j};
            skip = nbits(j)+1;
            a=1;
        end
        j = j+1;
    end
    i=i+1;
    bitstream = bitstream(skip:end);
end

dmsg = dmsg(dmsg~=1.5);


end