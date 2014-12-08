
%% EECS 445 - HW 04 - Q3 Intuitions behind Kernels in classification

%  Declaration
%  ------------
%  Date: 2014 / 10 / 30
%  Author: WU Tongshuang, 40782306

%  used helper function
%  --------------------
%  svmtrain(Training, Group, Name, Value)
%  svmclassify(structName, Sample)

%  Instructions
%  ------------
%  Use 5-fold cross validation to determine the best hyper-parameter, sigma 
%  for the SVM with RBF kernel. Try sigma2 ={0.2, 0.5, 1, 1.5, 2, 2.5, 3}.  

%% Initialization 
clear; close all; clc
rmpath('libsvm/libsvm-3.19/matlab');

%% ======================== Part 0: Load data =============================
fprintf('Running HW4 Q3b exercise ... \n');
load('q3_data.mat');
x_train = q3x_train; t_train = q3t_train;
x_test = q3x_test; t_test = q3t_test;

N_train = size(x_train, 1); % the number of training examples
N_test = size(x_test, 1);   % the number of test examples

N_test_cross = round(N_train / 5);
N_train_cross = N_train - N_test_cross;

sigma = [0.2, 0.5, 1, 1.5, 2, 2.5, 3];
accuracy_cross = zeros(7, 3);
for i = 1: size(sigma,2)
    aveAccuracy = 0;
    aveAccuracy_test = 0;
    for k = 1:5
        % split data
        startPoint = (k-1)*N_test_cross;
        endPoint = (k)*N_test_cross;
        x_test_cross = x_train(startPoint+1:endPoint,:);
        t_test_cross = t_train(startPoint+1:endPoint,:);
        x_train_cross = [];
        t_train_cross = [];
        if (startPoint > 1)
            x_train_cross = [x_train_cross; x_train(1:startPoint,:)];
            t_train_cross = [t_train_cross; t_train(1:startPoint,:)];
        end
        if (endPoint < N_train)
            x_train_cross = [x_train_cross; ...
                    x_train(endPoint+1:N_train,:)];
            t_train_cross = [t_train_cross; ...
                    t_train(endPoint+1:N_train,:)];
        end
         svmStruct = svmtrain(x_train_cross, t_train_cross, ...
            'kernel_function', 'rbf','rbf_sigma',sigma(i));
         result = svmclassify(svmStruct,x_test_cross);
         acc = sum(result==t_test_cross)/length(t_test_cross);
         result_test = svmclassify(svmStruct,x_test);
         acc_test = sum(result_test==t_test)/length(t_test);
%% ======================= Part 2: compute accuracy =======================
         aveAccuracy = acc + aveAccuracy;
         aveAccuracy_test = acc_test + aveAccuracy_test;
    end
    aveAccuracy = aveAccuracy / 5;
    aveAccuracy_test = aveAccuracy_test / 5;
    accuracy_cross(i,:) = [sigma(i), aveAccuracy, aveAccuracy_test];
end
accuracy_cross

