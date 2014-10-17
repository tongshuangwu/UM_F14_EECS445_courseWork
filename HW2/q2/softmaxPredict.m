function [accuracy index] = softmaxPredict(x_test, t_test,N_test, w)
% 2(b)
% implement Gradient Ascent for Softmax Regression

% x_test: N * dimention
% t_test: N * 1
% w: #category-1 * dimention
multi = exp(x_test*w'); % N * category 
multi_train = [multi ones(N_test,1)];
sumHx = repmat(sum(multi_train,2),1,3);

hx = multi_train./sumHx;
[prob, index] = max(hx');
accuracy = 0;
index = index';
for i = 1:N_test
    if index(i) == t_test(i)
        accuracy = accuracy +1;
    end
end
accuracy = accuracy / N_test;
end