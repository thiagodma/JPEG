function [p,Ab] = getData(msg)

Ab = unique(msg);
count = zeros(length(Ab),1);

for i=1:length(Ab)
    count(i) = sum(msg==Ab(i));
end

p = count/length(msg);

Abx = cell(size(Ab));

for i=1:length(Ab)
    Abx{i} = Ab(i);
end

Ab = Abx;

end