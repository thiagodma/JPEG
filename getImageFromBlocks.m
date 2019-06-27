function outImg = getImageFromBlocks(Blocks,m,n) %m é o numero de linhas da imagem, n é o numero de colunas da imagem

outImg = ones(m,n)*-1;
j=1;
k=1;
i=1;

while (i <= length(Blocks))
    
    [m1,n1] = size(Blocks{i});
    while(k <= n)
        [m1,n1] = size(Blocks{i});
        outImg(j:j+(m1-1),k:k+(n1-1)) = Blocks{i};
        k = k+n1;
        i = i+1;
    end
    j = j+m1;
    k = 1;

end
outImg = uint8(outImg);
end