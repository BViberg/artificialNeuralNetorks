%  Load train/val inputs/outputs
tmp=csvread('training_set.csv');
trainX=tmp(:,1:2);
trainY=tmp(:,3);
tmp=csvread('validation_set.csv');
valX=tmp(:,1:2);
valY=tmp(:,3);
clear tmp

[lenTrain,nbrInputNeurons]=size(trainX);
nbrHiddenNeurons=10;
[~,nbrOutputNeurons]=size(trainY);

Network=struct( 'input',    struct('activation', zeros(nbrInputNeurons,1)),...
                'hidden1',  struct( 'activation',zeros(nbrInputNeurons,1),...
                                    'error',zeros(nbrInputNeurons,1),...
                                    'weights',   zeros(nbrHiddenNeurons,nbrInputNeurons),...
                                    'bias',      zeros(nbrHiddenNeurons,1)),...
                'hidden2',  struct( 'activation',zeros(nbrInputNeurons,1),...
                                    'weights',   zeros(nbrHiddenNeurons,nbrHiddenNeurons),...
                                    'bias',      zeros(nbrHiddenNeurons,1)),...
                'output',   struct( 'activation',zeros(nbrInputNeurons,1),...
                                    'weights',   zeros(nbrOutputNeurons,nbrHiddenNeurons),...
                                    'bias',      zeros(nbrOutputNeurons,1)));


% Initialise values of weights
a=-0.1;
b=0.1;

% REdo init to gaussian not uniform
Network.hidden1.weights=a + (b-a).*rand(nbrHiddenNeurons,nbrInputNeurons); %uniform [-0.2,0.2]
Network.hidden2.weights=a + (b-a).*rand(nbrHiddenNeurons,nbrHiddenNeurons); %uniform [-0.2,0.2]
Network.output.weights =a + (b-a).*rand(nbrOutputNeurons,nbrHiddenNeurons); %uniform [-0.2,0.2]

%% Train network

T=1e3;
layers={'input','hidden1','hidden2','output'};
lenLayers=numel(layers);

for t=1:1
    Network.input.activation=trainX(randi(lenTrain),:)';
    % Forward prop
    for l=2:lenLayers
        W=Network.(layers{l}).weights;
        bias=Network.(layers{l}).bias;
        vPrev=Network.(layers{l-1}).activation;
        Network.(layers{l}).activation=tanh(W*vPrev-bias);
    end
    err=(1-tanh()^2)*()%%%%% PICK up here
end
