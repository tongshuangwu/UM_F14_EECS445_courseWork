function [accuracy] = SVMPredict(x_test, t_test,N_test, w, b)
% 3(b)
% implement Gradient Ascent for SVM

% x_test: N * dimention
% t_test: N * 1
% w: dimention * 1
% b: 1 * 1

classifier = x_test * w + b;
pos = find(classifier > 0);
neg = find(classifier <= 0);
classifier(pos) = 1;
classifier(neg) = -1;
checkAccuracy = classifier .* t_test;
accuracy = find(checkAccuracy >0 );
accuracy = size(accuracy,1)/N_test;

end