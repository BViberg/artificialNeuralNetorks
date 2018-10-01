%% generate patterns
pVector=[12,20,40,60,80,100];
N=100;

%loop over p
err=double(zeros(1,length(pVector)));
counter=0;
nbrTrials=1e5;
for p = pVector
    counter=counter+1;
    errVec=zeros(1,nbrTrials);
   parfor jj=1:nbrTrials
       pattern=genPatterns(N,p);
       iIndex=randi([1,N]); 
       nuIndex=randi([1,p]);
       weights = hebbsRule(pattern,false,iIndex);
       S0=pattern(:,nuIndex);
       S1=signum(weights(iIndex,:)*S0);
       errVec(jj) = double(~isequal(S0(iIndex),S1));
       
   end
   err(counter)=sum(errVec);
   disp('-----------------')
   disp(p)
   disp(err(counter)/nbrTrials)
   disp('-----------------')
end

function [patterns] = genPatterns(N,p)
%GENPATTERNS generates random patterns each coulmn in patterns 
values = [-1,1];
index = randi([1,2],N,p);
patterns = values(index);
end

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

function [signX] = signum(x)
% SIGNUM returns sign of input(>0 => 1,<0 => -1). signum(0) will return 1
signX=sign(x);
signX(signX==0)=1;
end



