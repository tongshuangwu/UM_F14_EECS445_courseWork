function [class] = nearestNeighborImprove(index,k,digits_train,labels_train,digits_test,labels_test)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal eq
close all;
im = digits_test(index, :, :);
distance = zeros(length(digits_train),2);
w = zeros(length(digits_train));
neighbor = zeros(k,2);
trainNum = size(digits_train);
KNN = [];
% compute distances
for trainFigNum = 1:trainNum
    trainFig = digits_train(trainFigNum, :, :);
    diff = trainFig - im;
    distance(trainFigNum,1) = sum(sum(diff.^2))^0.5;
    %distance(trainFigNum,1) = norm(reshape(diff,28,28),2);
    if distance(trainFigNum,1) == 0
        distance(trainFigNum,2) = 1;
    else
        distance(trainFigNum,2) = 1/distance(trainFigNum);
    end
end
[distance_d, i_d]= sort(distance(:,1));
neighborIndex = i_d(1:k);
for i = 1:k
    flag = -1;
    indexTrain = i_d(i);
    neighbor(indexTrain,1) = labels_train(indexTrain);
    neighbor(indexTrain,2) = distance(indexTrain,2);
    for j = 1:size(KNN,1)
        if KNN(j,1) == neighbor(indexTrain,1)
            KNN(j,2) = KNN(j,2)+neighbor(indexTrain,2);
            flag = 1;
        end
    end
    if flag == -1
        
        KNN = [KNN; neighbor(indexTrain,1) neighbor(indexTrain,2)];
    end
    %KNN(i) = labels_train(indexTrain);
    %KNN(i,1) = i_d(i);
    %KNN(i,2) =labels_train(indexTrain);
end
[KNN_d, j_d]= sort(KNN(:,2));

class = KNN(j_d(length(j_d)),1);
%plotNeighbor(index, neighborIndex,digits_test,digits_train ,labels_test);

end
