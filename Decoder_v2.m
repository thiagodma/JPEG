function dmsg = Decoder_v2(filename)
tic
fid = fopen(filename,'rb');
m = fread(fid,1,'uint16');
n = fread(fid,1,'uint16');
quality = fread(fid,1,'uint8');
tamanhoExtensao = fread(fid,1,'uint8');
extensao = char(fread(fid,tamanhoExtensao,'uint8'));
extensao = extensao';
R = fread(fid, 1, 'uint8');
sizeAb = fread(fid, 1, 'uint8');
sizeAb = sizeAb + 1;
Ab = {};
codes = {};

for i = 1:sizeAb
    Ab{i} = fread(fid, 1, 'int8');
    lengthCodes = fread(fid, 1, 'int8');
    codes{i} = char(fread(fid, lengthCodes, 'int8'));
    codes{i} = codes{i}';
end
codes = codes'; %transpor para ficar igual ao cell array do codificador
Ab = Ab';

bitstream = fread(fid, 'int8');

fclose(fid);
%agora já temos tudo que é necessário para decodificar a mensagem


bitstream = dec2bin(bitstream);
bitstream = reshape(bitstream',[1 size(bitstream,1)*size(bitstream,2)]);
bitstream(end-R+1:end) = [];

dmsg = decodifica_v2(Ab,codes, bitstream);

decodedFile = [];

for i=1:length(filename)
    if(filename(i) == '_')
        break;
    end
    decodedFile = strcat(decodedFile,filename(i));
end

decodedFile = strcat(decodedFile,'_JPEGdecoded',extensao);
decodedFile = decodedFile(decodedFile ~= char(0))

fid = fopen(decodedFile, 'wb');
%Escreve os dados no arquivo.
fwrite(fid, dmsg, 'uint8');
fclose(fid);
toc
end