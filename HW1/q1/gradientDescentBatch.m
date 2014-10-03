function [theta, J_history] = gradientDescentBatch(X, y, theta, alpha)
% 1(a)
% batch gradient decent to calculate w
% save the iteration num.

J_history = zeros(3000, 1);

iter = 1;
while(true)

    h_func =  X * theta - y;
    theta(1) = theta(1) - alpha * sum(h_func.*X(:,1));
    theta(2) = theta(2) - alpha * sum(h_func.*X(:,2));   

    J_history(iter) = computeCost(X, y, theta);
    if (iter >1)
        if(J_history(iter)-J_history(iter-1)==0)
            break;
        end
    end
    iter = iter+1;

end

end
