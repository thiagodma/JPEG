function Blocks = invZigZag(zzBlocks_matrix)

Blocks = cell(size(zzBlocks_matrix,1),1);

for i=1:length(Blocks)
    
    Blocks{i}(1,1) = zzBlocks_matrix(i,1);
    Blocks{i}(1,2) = zzBlocks_matrix(i,2);
    Blocks{i}(2,1) = zzBlocks_matrix(i,3);
    Blocks{i}(3,1) = zzBlocks_matrix(i,4);
    Blocks{i}(2,2) = zzBlocks_matrix(i,5);
    Blocks{i}(1,3) = zzBlocks_matrix(i,6);
    Blocks{i}(1,4) = zzBlocks_matrix(i,7);
    Blocks{i}(2,3) = zzBlocks_matrix(i,8);
    Blocks{i}(3,2) = zzBlocks_matrix(i,9);
    Blocks{i}(4,1) = zzBlocks_matrix(i,10);
    Blocks{i}(5,1) = zzBlocks_matrix(i,11);
    Blocks{i}(4,2) = zzBlocks_matrix(i,12);
    Blocks{i}(3,3) = zzBlocks_matrix(i,13);
    Blocks{i}(2,4) = zzBlocks_matrix(i,14);
    Blocks{i}(1,5) = zzBlocks_matrix(i,15);
    Blocks{i}(1,6) = zzBlocks_matrix(i,16);
    Blocks{i}(2,5) = zzBlocks_matrix(i,17);
    Blocks{i}(3,4) = zzBlocks_matrix(i,18);
    Blocks{i}(4,3) = zzBlocks_matrix(i,19);
    Blocks{i}(5,2) = zzBlocks_matrix(i,20);
    Blocks{i}(6,1) = zzBlocks_matrix(i,21);
    Blocks{i}(7,1) = zzBlocks_matrix(i,22);
    Blocks{i}(6,2) = zzBlocks_matrix(i,23);
    Blocks{i}(5,3) = zzBlocks_matrix(i,24);
    Blocks{i}(4,4) = zzBlocks_matrix(i,25);
    Blocks{i}(3,5) = zzBlocks_matrix(i,26);
    Blocks{i}(2,6) = zzBlocks_matrix(i,27);
    Blocks{i}(1,7) = zzBlocks_matrix(i,28);
    Blocks{i}(1,8) = zzBlocks_matrix(i,29);
    Blocks{i}(2,7) = zzBlocks_matrix(i,30);
    Blocks{i}(3,6) = zzBlocks_matrix(i,31);
    Blocks{i}(4,5) = zzBlocks_matrix(i,32);
    Blocks{i}(5,4) = zzBlocks_matrix(i,33);
    Blocks{i}(6,3) = zzBlocks_matrix(i,34);
    Blocks{i}(7,2) = zzBlocks_matrix(i,35);
    Blocks{i}(8,1) = zzBlocks_matrix(i,36);
    Blocks{i}(8,2) = zzBlocks_matrix(i,37);
    Blocks{i}(7,3) = zzBlocks_matrix(i,38);
    Blocks{i}(6,4) = zzBlocks_matrix(i,39);
    Blocks{i}(5,5) = zzBlocks_matrix(i,40);
    Blocks{i}(4,6) = zzBlocks_matrix(i,41);
    Blocks{i}(3,7) = zzBlocks_matrix(i,42);
    Blocks{i}(2,8) = zzBlocks_matrix(i,43);
    Blocks{i}(3,8) = zzBlocks_matrix(i,44);
    Blocks{i}(4,7) = zzBlocks_matrix(i,45);
    Blocks{i}(5,6) = zzBlocks_matrix(i,46);
    Blocks{i}(6,5) = zzBlocks_matrix(i,47);
    Blocks{i}(7,4) = zzBlocks_matrix(i,48);
    Blocks{i}(8,3) = zzBlocks_matrix(i,49);
    Blocks{i}(8,4) = zzBlocks_matrix(i,50);
    Blocks{i}(7,5) = zzBlocks_matrix(i,51);
    Blocks{i}(6,6) = zzBlocks_matrix(i,52);
    Blocks{i}(5,7) = zzBlocks_matrix(i,53);
    Blocks{i}(4,8) = zzBlocks_matrix(i,54);
    Blocks{i}(5,8) = zzBlocks_matrix(i,55);
    Blocks{i}(6,7) = zzBlocks_matrix(i,56);
    Blocks{i}(7,6) = zzBlocks_matrix(i,57);
    Blocks{i}(8,5) = zzBlocks_matrix(i,58);
    Blocks{i}(8,6) = zzBlocks_matrix(i,59);
    Blocks{i}(7,7) = zzBlocks_matrix(i,60);
    Blocks{i}(6,8) = zzBlocks_matrix(i,61);
    Blocks{i}(7,8) = zzBlocks_matrix(i,62);
    Blocks{i}(8,7) = zzBlocks_matrix(i,63);
    Blocks{i}(8,8) = zzBlocks_matrix(i,64);

end


end