
% Problem 3 part e
addpath('libsvm-3.19/matlab');
load('q3_data.mat');

% part a
model = svmtrain(q3t_train, q3x_train, '-t 0');
%plotboundary(q3t_train, q3x_train, model);
[predicted_label, accuracy, ~] = svmpredict(q3t_test, q3x_test, model);

% part b
model = svmtrain(q3t_train, q3x_train, '-t 2 -g 1');
%plotboundary(q3t_train, q3x_train, model);
[predicted_label, accuracy, ~] = svmpredict(q3t_test, q3x_test, model);

% part d
% 5-fold cross validation
K = length(q3t_train)/5;
sigmas = [0.2, 0.5, 1, 1.5, 2, 2.5, 3];
accuracies = zeros(1, length(sigmas));

for sigma=1:length(sigmas)
    accuracy = 0;
    for k=1:5        
        tfront = [];
        tback = [];
        xfront = [];
        xback = [];
        if(k>1)
            tfront = q3t_train(1:(k-1)*K);
            xfront = q3x_train(1:(k-1)*K, :);
        end
        if(k<5)
            tback = q3t_train(k*K+1:end);
            xback = q3x_train(k*K+1:end, :);
        end
        q3t_train_k = [tfront; tback];
        q3x_train_k = [xfront; xback];
        q3t_test_k = q3t_train((k-1)*K+1:k*K);
        q3x_test_k = q3x_train((k-1)*K+1:k*K, :);
        
        optstr = sprintf('-t 2 -g %f', sigmas(sigma));
        model = svmtrain(q3t_train_k, q3x_train_k, optstr);
        [predicted_label, svmacc, ~] = svmpredict(q3t_test_k, q3x_test_k, model);
        accuracy = accuracy + svmacc(1);
        
    end
    accuracy = accuracy/5;
    accuracies(sigma) = accuracy;
end

for sigma=1:length(sigmas)
    fprintf('sigma = %.1f, accuracy = %.1f%%\n', sigmas(sigma), accuracies(sigma));
end
