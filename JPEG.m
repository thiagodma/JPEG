function JPEG(filename,quality)
tic
img = double(imread(filename));
m = size(img,1);
n = size(img,2);

Blocks = getBlocks(8,img);
qBlocks = cell(size(Blocks));   %cell com os blocos quantizados

Q = [16 11 10 16 24 40 51 61;   %matriz utilizada para fazer a quantização
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77;
    24 35 55 64 81 104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

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
    
    Blocks{i} = Blocks{i} - 128;
    Blocks{i} = dct2(Blocks{i});
    qBlocks{i} = round(Blocks{i}./Q);
    
end

zzBlocks_matrix = zigZag(qBlocks); %para testar com zig zag

% for i=1:length(qBlocks)
%     zzBlocks_matrix(i,:) = (qBlocks{i}(:))';  %para testar sem o zig zag
% end

msg = getMsg(zzBlocks_matrix);

msg = msg';
bitstream2 = Compress(filename,msg,quality,m,n);

toc
end