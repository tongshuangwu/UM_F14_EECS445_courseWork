function [class] = nearestNeighbor_plot(index,k,digits_train,labels_train,digits_test,labels_test)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal eq
close all;
im = digits_test(index, :, :);
distance = zeros(length(digits_train));

trainNum = size(digits_train);
KNN = zeros(k,1);
% compute distances
for trainFigNum = 1:trainNum
    trainFig = digits_train(trainFigNum, :, :);
    diff = trainFig - im;
    distance(trainFigNum) = sum(sum(diff.^2))^0.5;
end
[distance_d,i_d]= sort(distance);
neighborIndex = i_d(1:k);
for i = 1:k
    indexTrain = i_d(i);
    %KNN(i) = labels_train(indexTrain);
    KNN(i,1) = i_d(i);
    KNN(i,2) =labels_train(indexTrain);
end

%class = mode (KNN);
plotNeighbor(index, neighborIndex,digits_test,digits_train ,labels_test);

end
