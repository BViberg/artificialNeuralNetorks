%% generate patterns
p=[12,20,40,60,80,100];
N=100;

%loopa över p
err=int8(zeros(1,length(p)));
for ii=p
   for jj=1:1e5
       pattern=genPatterns(N,ii);
       weights = hebbsRule(pattern,false);
       randIndex=randi([1,100]);
       S0=pattern()
       S1
       err(ii) = err(ii)+int8(c>1);
   end
end
%för varje p: genererra pattern och beräkna asynkron dynamik 1e5 ggr. approx P_error genom
%andelen fel (enligt ekv 2.33). 

%% Asynchron dynamic (se eq 2.8)

%% Ekvation 2.33 beskriver om n'tverket har gjort ett fel (if Ci>1 then fel)