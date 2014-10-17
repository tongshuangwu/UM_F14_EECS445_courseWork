
%% EECS 445 - HW 02 - Q2 Gaussian Discriminate Analysis

%  Declaration
%  ------------
%  Date: 2014 / 10 / 02
%  Author: WU Tongshuang, 40782306

%  used helper function
%  --------------------
%  softmaxGradient(x_train, t_train, N_train, w, alpha, category, m)
%  softmaxPredict(x_test, t_test,N_test, w)

%  Instructions
%  ------------
%  Using the gradient computed in part (a), implement Gradient Ascent for 
%  Softmax Regression in Matlab. Use a learning rate a = 0.0005. 
%  Load the file q2 data.mat, which contains the variables q2x train, 
%  q2t train, q2x test, q2t test. Train your classifier on the training 
%  data 

%% Initialization
clear; close all; clc
%% ======================== Part 0: Load data =============================
fprintf('Running HW2 Q2 exercise ... \n');
load('q2_data.mat');
x_train = q2x_train; t_train = q2t_train;
x_test = q2x_test; t_test = q2t_test;


N_train = size(x_train, 1); % the number of training examples
N_test = size(x_test, 1);   % the number of test examples


x_train = [ones(N_train,1) x_train];
x_test = [ones(N_test,1) x_test];
m = size(x_train, 2);       % the dimention of x
category = max(t_train);

% logisticplotData(x_test, t_test);

%% ======================= Part 1: Compute parameter ======================
fprintf('Compute parameter ... \n');
w = 0.005 * randn((category-1) * m, 1);
alpha = 0.0005;
w = softmaxGradient(x_train, t_train, N_train, w, alpha, category, m);
w_extract = [w; zeros(1,m)]' % since w3 is fixed to 0
%% ======================= Part 2: compute accuracy =======================
fprintf('Compute accuracy for test ...\n')
[accuracy, index] = softmaxPredict(x_test, t_test,N_test, w);
accuracy