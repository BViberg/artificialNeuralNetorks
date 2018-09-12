function [patterns] = genPatterns(N,p)
%GENPATTERNS generates random patterns each coulmn in patterns 
values = [-1,1];
index = randi([1,2],N,p);
patterns = values(index);
end

