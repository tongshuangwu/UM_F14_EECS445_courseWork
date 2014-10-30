% problem 3 part b
load('q3.mat');
N_train = length(q3t_train);
N_test = length(q3t_test);
[~, M] = size(q3x_train);
w = zeros(M, 1);
b = 0;
wgrad = zeros(M, 1);
b = 0;
bgrad = 0;
C = 5; %slack cost
eta = 0.5;

numIters = [5, 50, 100, 1000, 5000, 6000];
for iters = 1:length(numIters)


    for j=1:numIters(iters)
        alpha = eta/(1+j*eta);
        Ind = ((q3t_train.*(w'*q3x_train'+b)')<1);
        wgrad = w-C*q3x_train' * (Ind.*q3t_train);
        bgrad = -C*sum( ((q3t_train.*(w'*q3x_train'+b)')<1).*q3t_train );
        w = w-alpha*wgrad;
        b = b-0.01*alpha*bgrad;
    end

    q3t_predict = 2*(((w'*q3x_test'+b)>0)'-0.5);
    accuracy = (N_test-length(find(q3t_test - q3t_predict)))/N_test*100;
    
    fprintf('With %d iterations, accuracy is %.1f%%\n', numIters(iters), accuracy);
    fprintf('b = %f\nw =\n', b); disp(w);
end