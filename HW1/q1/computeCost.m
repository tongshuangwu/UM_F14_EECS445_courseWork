function J = computeCost(X, y, theta)
%COMPUTECOST Compute objective function for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y
%   q1
% Initialize some useful values
m = length(y); % number of training examples

J = 0;

h_func =  X * theta - y;
J = 1/(2) * sum(h_func.^2);

end
