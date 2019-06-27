function Blocks = getBlocks(N,img)  %essa função gera os blocos que serão quantizados

nBlocks = ceil((size(img,1)*size(img,2))/(N^2));
Blocks = cell(nBlocks,1);

i=1;
j=1;
k=1;

while(j < size(img,1))
    
    while((k - size(img,2)) < 0)
        
        if(k+N-1 <= size(img,2))            
            Blocks{i} = img(j:j+(N-1),k:k+(N-1));
            k = k+N;
            i = i+1;
        else
            Blocks{i} = img(j:j+(N-1),k:size(img,2));
            k = size(img,2);
            i = i+1;
        end
    end
    
    j = j+N;
    k = 1;
end



end