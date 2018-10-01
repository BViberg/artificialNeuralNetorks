targets=[[1, -1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1, -1, 1, 1, 1];...
        [-1, -1, 1, 1, 1, -1, -1, -1, -1, 1, 1, -1, 1, 1, 1, -1],...
        [-1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, 1, 1],...
        [1, 1, 1, 1, 1, -1, -1, 1, 1, 1, -1, -1, 1, 1, -1, 1],...
        [-1, -1, 1, 1, 1, -1, 1, -1, -1, 1, -1, -1, -1, -1, 1, -1],...
        [-1, 1, -1, -1, -1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1, 1]];

M=csvread('input_data_numeric.csv',0,1)';
a=-0.2;
b=0.2;
beta=0.5;
learnRate=0.02;
Network.W= a + (b-a).*rand(1,4); %uniform [-0.2,0.2]
Network.bias=5*(a + (b-a).*rand(1));%uniform [-1,1]
Network.output=tanh(beta*(Network.W*M(:,1)+Network.theta));
%dWi=learnRate*sum(target-output)*(1-tanh())
dW=zeros(4,1);
dBias=0;
targetIndex=1;
for ii=1:1e5
    randMu=randi(16);
    randOutput=tanh(beta*(Network.W*M(:,randMu)+Network.theta));
    randTraget=targets()
    dW = learnRate*beta*(randTarget-randOutput)
    dBias = 
    Network.W=Network.W+dW;
    Network.bias=Network.bias+dBias;
end