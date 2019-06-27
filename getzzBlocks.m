function zzBlocks_matrix = getzzBlocks(msg)

k=1;
zzBlocks_matrix = [];

while(k <= length(msg))
    
    line = zeros(1,64);
    s = msg(k);
    if(k+s > length(msg))
        line(1:length(msg)-k) = msg(k+1:length(msg));
        zzBlocks_matrix = [zzBlocks_matrix;line];
        k = k+s+1;
    else
        line(1:s) = msg(k+1:k+s);
        zzBlocks_matrix = [zzBlocks_matrix;line];
        k = k+s+1;
    end
    
end