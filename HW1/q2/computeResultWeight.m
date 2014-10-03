function [output] = ComputeResultWeight(X, y, gama)
% evaluating h(?) at a query point x (which is real-valued in this problem)
x_query = X(:,2);
theta = zeros(size(X, 2), 1);
xLength = size(X, 1)
R =[];
output=[];

theta = inv(transpose(X) * X) * transpose(X) * y;
for j = 1: xLength
    R = [];
    x_q_plot = X(j,:);% x is a set of x0 and x1
    x_q = X(j,2);% x is a set of x0 and x1
    for i = 1: xLength
        x = X(i,:);% x is a set of x0 and x1
        r = exp(-(x_q-x(2)).^2/(2*gama^2));
        R =[R r];
    end
    R = diag(R);
    theta = inv((X'*R'*X))*X'*R*y;
    y_q_plot = theta'*x_q_plot';
    output = [output y_q_plot];
end
output = output';

end
