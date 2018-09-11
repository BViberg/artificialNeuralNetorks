function [weights] = hebbsRule(pattern,diagZero)
%UNTITLED4 This function returns the weights that store the pattern
%according to hebbs rule. If diagZero is true then w_ii = 0.
pattern=pattern(:); % ensure column vector
weights = pattern*pattern'/(length(pattern)^2);
if diagZero
   weights= weights-eye(length(pattern))/(length(pattern)^2);
end
end

