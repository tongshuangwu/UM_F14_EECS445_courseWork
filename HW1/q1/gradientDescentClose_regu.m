function [theta] = gradientDescentClose_regu(X, y, lamda)
% 2(d)(ii)
% Computes the closed-form solution to linear regression 

% Initialize some useful values
m = length(y); % number of training examples

theta = inv(lamda * eye(size(X,2))+X'*X)*X' * y;


end
