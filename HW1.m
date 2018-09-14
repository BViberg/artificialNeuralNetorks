profile on
%% generate patterns
pVector=[12];%,20,40,60,80,100];
N=100;

%loopa över p
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

err/nbrTrials

profile viewer
