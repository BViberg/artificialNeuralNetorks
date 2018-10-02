% Create targets and outputs
targets=[[1, -1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1, -1, 1, 1, 1];...
    [-1, -1, 1, 1, 1, -1, -1, -1, -1, 1, 1, -1, 1, 1, 1, -1];...
    [-1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, -1, -1, 1, 1];...
    [1, 1, 1, 1, 1, -1, -1, 1, 1, 1, -1, -1, 1, 1, -1, 1];...
    [-1, -1, 1, 1, 1, -1, 1, -1, -1, 1, -1, -1, -1, -1, 1, -1];...
    [-1, 1, -1, -1, -1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1, 1]];
M=csvread('input_data_numeric.csv',0,1)';

% Define network parameters and initialise.
beta=0.5;
learnRate=0.02;
a=-0.2;
b=0.2;
Network.W = a + (b-a).*rand(1,4); %uniform [-0.2,0.2]
Network.bias = 5*(a + (b-a).*rand(1));%uniform [-1,1]
errorVec = zeros(length(targets(:,1)),1);% Vector to store number of wrongly classified inputs

for t_ix=1:length(targets(:,1))
    t=targets(t_ix,:);
    for ii=1:1e5
        Network.output=tanh(beta*(Network.W*M+Network.bias)); % Compute output of all inputs
        
        H = 0.5*sum((Network.output-t).^2);
        errorVec(t_ix)=0.5*sum(abs(signum(Network.output)-t)); % Store current error value
        if errorVec(t_ix)==0
            disp('Sluta!!!')
            pause()
            break;
        end
            
        %Store network parameters before update
        weights=Network.W;
        bias=Network.bias;
        
        % Update weights based on randomly choosen input
        randMu=randi(16);
        A=t(randMu)- Network.output(randMu);
        B=1-tanh(Network.W*M(:,randMu))^2;
        differentialUpdate = learnRate*beta*A*B*[M(:,randMu);-1]; % The bias can be viewed as a constant negative activation
        Network.W=Network.W + differentialUpdate(1:end-1)';
        Network.bias=Network.bias+differentialUpdate(end);
    end
end

function [signX] = signum(x)
% SIGNUM returns sign of input(>0 => 1,<0 => -1). signum(0) will return 1
signX=sign(x);
signX(signX==0)=1;
end
