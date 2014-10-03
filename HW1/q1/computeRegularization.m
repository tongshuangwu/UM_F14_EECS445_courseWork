function [error_train,error_test] = computeRegularization(x_train, x_test, y_train, y_test, error_train, error_test, lamda)
% compute error based on different regularization factor
% 1(c)

iters = 10; 
iter_regu = length(lamda);
m = length(y_train);

featureTrain = ones(m,1);
featureTest = ones(m,1);

for iter = 1:iters
    if iter > 1
        featureTrain_new = x_train.^(iter-1);
        featureTrain = [featureTrain, featureTrain_new];
        featureTest_new = x_test.^(iter-1);
        featureTest = [featureTest, featureTest_new];
    end
end



for iter = 1:iter_regu
    theta = gradientDescentClose_regu(featureTrain, y_train,lamda(iter));
    error_train(iter) = (2*(1/2 * (theta') * (featureTrain') * featureTrain * theta - (theta') * (featureTrain') * y_train + 1/2 * (y_train')*y_train )/m).^(0.5);
    error_test(iter) = (2*(1/2 * theta' * (featureTest') * (featureTest) * (theta) - (theta') * (featureTest') * y_test + 1/2 * (y_test')*y_test)/m).^(0.5);
end
