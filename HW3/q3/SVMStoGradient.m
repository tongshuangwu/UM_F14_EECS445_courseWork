function [w_sto, b_sto] = SVMStoGradient(C, n0, x_train, t_train,N_train ,w, b, NumIterations)
% 2(d)
% implement Gradient Ascent for Softmax Regression

% dimention:
% x_train: N * dimention
% y_train: N * 1
% indicator: #category * N
% w: dimention * 1
% t.*(x * w + b) get a result for every training sample, N * 1
% indicator function, #category * N

iter = 1;
w_sto = w;
b_sto = b;
while(iter <= NumIterations)
    alpha = n0 / (1+ iter * n0);
    for i = 1: N_train
        indicator = (t_train.*(x_train * w_sto + b_sto) < 1);

        w_sto = w_sto - alpha * (w_sto/N_train - C * (x_train(i,:)' * (indicator(i).*t_train(i))));
        b_sto = b_sto - 0.01 * alpha * (- C * indicator(i).*t_train(i));
    end
    iter = iter+1;
end

end