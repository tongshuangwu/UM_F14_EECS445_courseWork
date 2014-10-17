clc
clear

load data/q1_data

N = length(q1y_train);

phi = mean(q1y_train);

u0 = mean(q1x_train(q1y_train==0,:));

u1 = mean(q1x_train(q1y_train==1,:));

%sigma
Xbar_train = q1x_train-(q1y_train==0)*u0-(q1y_train==1)*u1;
sigma = 1/N*Xbar_train'*Xbar_train;

X0_test = q1x_test-repmat(u0,[size(q1x_test,1),1]);
X1_test = q1x_test-repmat(u1,[size(q1x_test,1),1]);
% find ratio of P1/P2
ratio = phi/(1-phi)*exp(0.5*diag(X0_test/sigma*X0_test')-0.5*diag(X1_test/sigma*X1_test'));

results =ratio>0.5;
accuracy = sum(results==q1y_test)/length(q1y_test)