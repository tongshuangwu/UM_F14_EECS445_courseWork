function [theta, J_history] = gradientDescentStochastic(X, y, theta, alpha)
% 1(a)
% stochastic gradient decent

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(3000, 1);
id = randperm(m);
iter = 1;
while(true)

    for n = 1:m
        h_func =  X(id(n),:) * theta - y(id(n),:);
        theta(1) = theta(1) - alpha * h_func.*X(id(n),1);
        theta(2) = theta(2) - alpha * h_func.*X(id(n),2);
    end

    J_history(iter) = computeCost(X, y, theta);
    if (iter >1)
        if(J_history(iter)-J_history(iter-1)==0)
            break;
        end
    end
    iter = iter+1;
end

end
