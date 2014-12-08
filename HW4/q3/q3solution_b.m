
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
%  Train an SVM over the training data using a Radial Basis Function (RBF)
%  kernel, also known as Gaussian Kernel. Plot the training data and the 
%  separating hyperplane. Report the test classification accuracy using 
%  the RBF kernel. 

%% Initialization 
clear; close all; clc  
rmpath('libsvm/libsvm-3.19/matlab');

%% ======================== Part 0: Load data =============================
fprintf('Running HW4 Q3b exercise ... \n');
load('q3_data.mat');
x_train = q3x_train; t_train = q3t_train;
x_test = q3x_test; t_test = q3t_test;

figure
svmStruct = svmtrain(x_train, t_train, 'showplot', true, ...
        'kernel_function', 'rbf');
result = svmclassify(svmStruct,x_test);
acc = sum(result==t_test)/length(t_test)
