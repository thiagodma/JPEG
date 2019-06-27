function msg = getMsg(zzBlocks_matrix)

msg = ones(1,size(zzBlocks_matrix,1)*size(zzBlocks_matrix,2))*(1.5);    %1.5 nunca é um valor possível
k=1;

for i=1:size(zzBlocks_matrix,1)
    
    for j=64:-1:1
        if(zzBlocks_matrix(i,j) ~= 0)
            break;
        end

    end

    msg(k) = j;
    msg(k+1:k+j) = zzBlocks_matrix(i,1:j);
    k = k+j+1;

end

for i=1:length(msg)
    if(msg(i) == 1.5)
        break;
    end
end

msg = msg(1:i-1);

end