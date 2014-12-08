function [gaussOut] = gauss(x,mu,cov)
    m = size(x,2);
    gaussOut = 1/((2*pi)^(m/2)*sqrt(det(cov)))...
        * exp(-1/2 * (x-mu) * inv(cov) * (x-mu)');
end