function bitstream2 = Compress(filename,msg,quality,m,n1)

[p,Ab] = getData(msg);
codes = getCode_v2(p,Ab);   %Ab é uma cell
aux = 0;
for i=1:length(filename)
    if((filename(i) == '.') | (aux==1))
        extensao(i) = filename(i);
        aux=1;
    end
end
tamanhoExtensao = length(extensao);
h = [length(Ab)-1]; %é um cabeçalho com a extensao do arquivo,
%o tamanho do alfabeto, o alfabeto, tamanho das codewords e as codewords

bitstream = encode(Ab,codes,msg);

n = length(bitstream);
n8 = ceil(n/8);
addZeros = 8 - rem(n,8); %acrescentar essa quantidade de zeros ao final do header para escrever byte a byte
bitstream = [bitstream dec2bin(0,n8*8 - n)];

for i = 1:length(filename)
    if (filename(i) == '.')
        break;
    else
        compressedFile(i) = filename(i);
    end
end

compressedFile = strcat(compressedFile , '_JPEGencoded_',int2str(quality));
fid = fopen(compressedFile, 'wb');

bitstream2 = zeros(ceil(n/8),1);

for (i = 1:1:length(bitstream2))
    bitstream2(i) = bin2dec(bitstream((i-1)*8 + 1: i*8));
end

%Escreve os dados no arquivo.
fwrite(fid,m,'uint16');
fwrite(fid,n1,'uint16');
fwrite(fid,quality,'uint8');
fwrite(fid,tamanhoExtensao,'uint8');
fwrite(fid,extensao,'char');
fwrite(fid, addZeros, 'uint8');

fwrite(fid,length(Ab)-1,'uint16');

for i = 1:length(Ab)
    fwrite(fid,Ab{i},'int16');
    fwrite(fid,length(codes{i}),'uint8');
    fwrite(fid,codes{i},'uint8');
end
fwrite(fid, bitstream2,'uint8');

fclose(fid);

end
