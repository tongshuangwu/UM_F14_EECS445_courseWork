function [w, J_history] = softmaxGradient(x_train, t_train, N_train, w, alpha, category, m)
% 2(d)
% implement Gradient Ascent for Softmax Regression

% dimention:
% x_train: N * dimention
% y_train: N * 1
% indicator: #category * N
% w: #category-1 * dimention

% indicator function, #category * N
indicator = full(sparse(t_train, 1:N_train, 1)); 
w = reshape(w, category-1, m);
iter = 1;

while(iter < 300000)
    
    multi = exp(x_train*w'); % N * category 
    multi_train = [multi ones(N_train,1)];
    sumHx = repmat(sum(multi_train,2),1,3);
    hx = multi_train./sumHx;
    cost = sum(sum(indicator' .* log(hx)));
    J_history(iter) = cost;
    if(iter > 1)
        if(J_history(iter)-J_history(iter-1)< 1e-7)
            break;
        end
    end
    thetagrad = (indicator - hx') * x_train;
    w = w + alpha * thetagrad(1:2,:);
    iter =iter+1;
end

end