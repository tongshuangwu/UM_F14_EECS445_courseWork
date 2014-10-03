function [theta] = gradientDescentClose(X, y)
% 1(a)
% Computes the closed-form solution to linear regression 

% Initialize some useful values
m = length(y); % number of training examples

theta = inv(X'*X)*X' * y;


end
