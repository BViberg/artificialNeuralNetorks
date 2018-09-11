function [signX] = signum(x)
%SIGNUM returns sign of input. signum(0) will return 1

if(x==0)
    signX=1;
else
    signX=sign(x);
end
end

