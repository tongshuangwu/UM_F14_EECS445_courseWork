
%% EECS 445 - HW 03 - Q4 Using Liblinear for SVM Classification

%  Declaration
%  ------------
%  Date: 2014 / 10 / 16
%  Author: WU Tongshuang, 40782306

%  used helper function
%  --------------------
%  svm_train(range)
%  svm_test(model)

%  Instructions
%  ------------
%  Train an SVM with training set sizes 50, 100, 200, . . . , 1400, 
%  by using the file MATRIX.TRAIN. E.g. to use a training set of 50, use 
%  the first 50 points from MATRIX.TRAIN. Plot the test error each time, 
%  using MATRIX.TEST as the test data. 

%% Initialization
clear; close all; clc
errors = zeros(6,2);
trainSet = [50, 100, 200, 400, 800, 1400];
%% ======================= Part 1: Compute parameter ======================
fprintf('Compute error ... \n');

for i =1:size(trainSet,2)
    model = svm_train(trainSet(i));
    error = svm_test(model);
    errors(i,1) = trainSet(i);
    errors(i,2) = error;
end
fprintf('The error ... \n');
errors

%% ======================= Part 2: plot error =======================
fprintf('Plot error ...\n')
plot(errors(:,1), errors(:,2),'-o');
