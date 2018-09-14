function [signX] = signum(x)
% SIGNUM returns sign of input(>0 => 1,<0 => -1). signum(0) will return 1
signX=sign(x);
signX(signX==0)=1;
end

