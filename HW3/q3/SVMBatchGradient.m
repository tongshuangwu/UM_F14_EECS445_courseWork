function [w_batch, b_batch] = SVMBatchGradient(C, n0, x_train, t_train, w, b, NumIterations)
% 2(d)
% implement Gradient Ascent for Softmax Regression

% dimention:
% x_train: N * dimention
% y_train: N * 1
% indicator: #category * N
% w: dimention * 1
% t.*(x * w + 1) get a result for every training sample, N * 1
% indicator function, #category * N

iter = 1;
w_batch = w;
b_batch = b;

while(iter <= NumIterations)
    alpha = n0 / (1+ iter * n0);
    indicator = (t_train.*(x_train * w_batch + b_batch)<1);

    w_batch = w_batch - alpha * (w_batch - C * (x_train' * (indicator.*t_train)));
    b_batch = b_batch - 0.01 * alpha * (- C * indicator'* t_train);
    iter = iter+1;
end


end