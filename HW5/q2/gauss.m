function yPlot = gauss(xPlot, GPmeans, GPsigmas)
m = size(xPlot);
y = zeros(m,1);
for i = 1:m
    y(i) = (1/sqrt(2 * pi * GPsigmas(i)))* ...
        exp(-(1/(2*GPsigmas(i))*(xPlot(i)-GPmeans(i)).^2));
end
yPlot = y;
end