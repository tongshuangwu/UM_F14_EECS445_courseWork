
%% EECS 445 - HW 03 - Q3 Implementing Soft Margin SVM

%  Declaration
%  ------------
%  Date: 2014 / 10 / 16
%  Author: WU Tongshuang, 40782306

%  used helper function
%  --------------------
%  SVMBatchGradient(C, n0, x_train, t_train, w, b, NumIterations)
%  SVMPredict(x_test, t_test,N_test, w, b)

%  Instructions
%  ------------
%  Implement the SVM algorithm using batch gradient descent. 

%% Initialization
clear; close all; clc
%% ======================== Part 0: Load data =============================
fprintf('Running HW3 Q3 exercise ... \n');
load('q3.mat');
x_train = q3x_train; t_train = q3t_train;
x_test = q3x_test; t_test = q3t_test;


N_train = size(x_train, 1); % the number of training examples
N_test = size(x_test, 1);   % the number of test examples

m = size(x_train, 2);       % the dimention of x

C = 5;
n0 = 0.5;

%% ======================= Part 1: Compute parameter ======================
NumIterations = [5 50 100 1000 5000 6000];
for i = 1:6
fprintf('============ Current iteration number: %d ============\n',...
    NumIterations(i));
fprintf('Compute parameter ... \n');
b = 0;
w = zeros(m,1);
[w_batch, b_batch] = SVMBatchGradient(C, n0, x_train, t_train, w, b, ...
    NumIterations(i))

%% ======================= Part 2: compute accuracy =======================
fprintf('Compute accuracy for test ...\n')
accuracy_batch = SVMPredict(x_test, t_test, N_test, w_batch, b_batch)

end
