function [likelihood] = ...
    gpLikelihood(m, X, t, sigma, beta)

% m: size of x

% initialize C
C = zeros(m,m);

% compute the orignial C
for i = 1:m
    for j = 1:m
        C(i,j) = kernel(sigma, X(i), X(j));
    end
end
C = C+ eye(m,m) * beta;
% compute the log likelihood 
likelihood = -1/2 * log(norm(C)) - 1/2* t' * inv(C) *t - m/2 * log(2*pi);

end