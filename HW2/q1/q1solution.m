
%% EECS 445 - HW 02 - Q1 Gaussian Discriminate Analysis

%  Declaration
%  ------------
%  Date: 2014 / 10 / 02
%  Author: WU Tongshuang, 40782306

%  used helper function
%  --------------------
%  computeParameter(x_train, t_train, N_train, m)
%  computeTest(x_test, t_test, N_test, phi, u0, u1, cov)

%  Instructions
%  ------------
%  Using the M.L.E of the parameters given in part (b), compute each 
%  parameter¡¯s value. Load the file q1 data.mat, which contains the variables
%  q1x train, q1y train, q1x test, q1y test. First, use training data to 
%  estimate parameter values. Report your estimation result. Then, use your 
%  result and your answer in (a) to classify test data. 
%  Report your test accuracy.

%% Initialization
clear; close all; clc
%% ======================== Part 0: Load data =============================
fprintf('Running HW2 Q1 exercise ... \n');
load('q1_data.mat');
x_train = q1x_train; t_train = q1y_train;
x_test = q1x_test; t_test = q1y_test;
N_train = size(x_train, 1); % the number of training examples
N_test = size(x_test, 1);   % the number of training examples
m = size(x_train, 2);       % the dimention of x


%logisticplotData(x_test, t_test);

%% ======================= Part 1: Compute parameter ======================
fprintf('Compute parameter ... \n');
[phi,u0,u1,cov] = computeParameter(x_train, t_train, N_train, m)

%% ======================= Part 2: compute accuracy =======================
fprintf('Compute accuracy for test ...\n')
accuracy = computeTest(x_test, t_test, N_test, phi, u0, u1, cov)
