function [GPmeans, GPsigmas] = ...
    gpRegression(m, queryM, X, queryX, t, sigma, beta)

% m: size of x

% initialize C
C = zeros(m,m);
GPmeans = zeros(queryM,1);
GPsigmas = zeros(queryM,1);

% compute the orignial C
for i = 1:m
    for j = 1:m
        C(i,j) = kernel(sigma, X(i), X(j));
    end
end
C = C+ eye(m,m) * beta;

for i = 1:queryM
    c = kernel(sigma, queryX(i), queryX(i))+beta;
    GPk = zeros(m, 1);

    for j = 1:m
        GPk(j) = kernel(sigma, queryX(i), X(j));
    end
    
    % assign values for the Cnew
    GPmeans(i) = GPk' *inv(C) * t;
    GPsigmas(i) = c - GPk' *inv(C) * GPk;
    % new gaussian distribution
end

% plot
figure
hold on
title(sprintf('sigma = %f, beta = %f',sigma, beta));
plot(X,t,'or');
errorbar(queryX, GPmeans, GPsigmas, 'y');
hold off
end