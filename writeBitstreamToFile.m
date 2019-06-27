function writeBitstreamToFile(bitstream,filename,m,n1)

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

compressedFile = strcat(compressedFile , '_JPEGencoded');
fid = fopen(compressedFile, 'wb');

bitstream2 = zeros(ceil(n/8),1);

for (i = 1:1:length(bitstream2))
    bitstream2(i) = bin2dec(bitstream((i-1)*8 + 1: i*8));    
end

%Escreve os dados no arquivo.

fwrite(fid,m,'uint16');
fwrite(fid,n1,'uint16');
fwrite(fid,quality,'uint8');
%fwrite(fid, addZeros, 'uint8');

fwrite(fid, bitstream2, 'int8');

fclose(fid);
end