function [weights] = hebbsRule(pattern,diagZero)
%HEBBSRULE This function returns the weights that store the pattern
%according to hebbs rule. If diagZero is true then w_ii = 0.

[N,p]=size(pattern);
for i=1:p
    weights = weights + pattern(:,i)*pattern(:,i)';
end
if diagZero
   weights(logical(eye(N)))= 0;
end
weights=weights/N;
end

