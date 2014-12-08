function k = kernel(sigma, x1, x2)

k = exp(-1/(2*sigma^2) * (x1-x2).^2);

end