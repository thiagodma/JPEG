%function bitstream = encoder(Ab,C,msg)
%
%   Codifica uma mensagem com um código VLC.
%
% - Recebe como parâmetro:
%   Ab: O alfabeto possível para a fonte. É uma matriz.
%   C : O código binário que será utilizado para codificar a fonte. É uma
%       célula (cell). 
%   msg: A mensagem a ser enviada.
%
% - Retorna: 
%   bitstream: o bitstream gerado. O bitstream gerado está no formato char.
%   
% - Exemplo:
%     Ab = ['A' 'B' 'C' 'D'];
%      C = {'0','10','110','111'}; 
%    msg = 'ABBACDDAAABCCCAAAAD';
%    bitstream = encode(Ab,C,msg);
function bitstream = encode(Ab,C,msg)

for i=1:length(Ab)
    Abx(i) = Ab{i};
end

Ab = Abx;

n = length(msg);
bitstream = [];

%Para todos os elementos da mensagem.
for (i = 1:1:n)
    %Encontra o index do elemento atual (msg(i)) no código.
    idx = (msg(i) == Ab);
    
    %Anexa ao bitstream o código binário referente ao elemento atual.
    bitstream = [bitstream C{idx}];
end

