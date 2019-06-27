function outImg = JPEG_decoder(filename)
tic
Q = [16 11 10 16 24 40 51 61;   %matriz utilizada para fazer a quantização
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

fid = fopen(filename,'rb');
m = fread(fid,1,'uint16');
n = fread(fid,1,'uint16');
quality = fread(fid,1,'uint8');
tamanhoExtensao = fread(fid,1,'uint8');
extensao = char(fread(fid,tamanhoExtensao,'uint8'));
extensao = extensao';
R = fread(fid, 1, 'uint8');
sizeAb = fread(fid, 1, 'uint16');
sizeAb = sizeAb + 1;
Ab = {};
codes = {};


for i = 1:sizeAb
    Ab{i} = fread(fid, 1, 'int16');
    lengthCodes = fread(fid, 1, 'uint8');
    codes{i} = char(fread(fid, lengthCodes, 'uint8'));
    codes{i} = codes{i}';
end
codes = codes'; %transpor para ficar igual ao cell array do codificador
Ab = Ab';

bitstream = fread(fid,'uint8');
fclose(fid);

%agora já temos tudo que é necessário para decodificar a mensagem

bitstream = dec2bin(bitstream);
bitstream = reshape(bitstream',[1 size(bitstream,1)*size(bitstream,2)]);
bitstream(end-R+1:end) = [];

dmsg = decodifica_v2(Ab,codes, bitstream);

zzBlocks_matrix = getzzBlocks(dmsg);

Blocks = invZigZag(zzBlocks_matrix);    %para testar com zig zag

% for i=1:size(zzBlocks_matrix,1)
%     Blocks{i} = reshape(zzBlocks_matrix(i,:),8,8);    %para testar sem zigzag
% end

if(quality == 1)    %0.5 bpp
    Q = Q*2.2;
end

if(quality == 2)    %1 bpp
    Q = Q*0.7;
end

if(quality == 3)    %1.5 bpp
    Q = Q*0.37;
end

if(quality == 4)    %2 bpp
    Q = Q*0.27;
end

for i=1:length(Blocks)
    
    Blocks{i} = Blocks{i}.*Q;
    Blocks{i} = idct2(Blocks{i});
    Blocks{i} = Blocks{i} + 128;
    
end

outImg = getImageFromBlocks(Blocks,m,n);

outFilename = [];

for i=1:length(filename)
    if(filename(i) == '_')
        break;
    else
        outFilename = [outFilename filename(i)];
    end
end

outFilename = strcat(outFilename, '_JPEGdecoded_',int2str(quality),'.bmp');

imwrite(outImg,outFilename);

toc

end