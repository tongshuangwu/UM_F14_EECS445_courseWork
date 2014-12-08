
%% EECS 445 - HW 05 - Q2a Gaussian Processes

%  Declaration
%  ------------
%  Date: 2014 / 11 / 28
%  Author: WU Tongshuang, 40782306

%  used helper function
%  --------------------
%  gpRegression(m, queryM, X, queryX, t, sigma, beta)
%  kernel(sigma, x1, x2)

%  Instructions
%  ------------
%  Implement Gaussian Process regression for arbitrary query points. 


%% Initialization
close all; clc

%% ======================= Part 1: Inpute data ============================
fprintf('Running Q2 exercise ... \n');
q2x = csvread('q2x.dat');
q2y = csvread('q2y.dat');

X = q2x; t = q2y;
m = length(t); % number of training examples

%% ====================== Part 2: Initialization ==========================
%X = [ones(m, 1), X]; % Add a column of ones to x
queryX = min(X):.2:max(X);
queryX = queryX';

queryM = size(queryX,1);
sigma = [1,0.2,10]; beta = [0.1,0.5,0.01];

%% =================== Part 3: Process the regression =====================
for i = 1: size(sigma,2)
    [GPmeans, GPsigmas] = ...
        gpRegression(m, queryM, X, queryX, t, sigma(i), beta(i));
end


    