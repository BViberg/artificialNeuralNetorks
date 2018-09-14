function [weights] = hebbsRule(pattern,diagZero,rowIndex)
%HEBBSRULE This function returns the weights that store the pattern
%according to hebbs rule. If diagZero is true then w_ii = 0.
% Iff rowIndex exists then only that row of weights is generated,
% NOTE that the matrix is still NxN but only that specific row can be 
% nonzero
[N,p]=size(pattern);
weights=zeros(N);
if nargin==2
    for i=1:p
        weights = weights + pattern(:,i)*pattern(:,i)';
    end
    if diagZero
        weights(logical(eye(N)))= 0;
    end
else
    for i=1:p
        weights(rowIndex,:)=weights(rowIndex,:)+pattern(rowIndex,i)*pattern(:,i)';
    end
    if diagZero
        weights(rowIndex,rowIndex)=0;
    end
end
weights=weights/N;

end

