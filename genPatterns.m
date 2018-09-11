function [patterns] = genPattern(N,p)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
values = [-1,1];
index = randi([1,2],N,p);
patterns = values(index);
end

