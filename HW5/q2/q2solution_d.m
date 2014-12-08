
%% EECS 445 - HW 05 - Q2d Gaussian Processes

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
%  search the hyperparameter values to maximize the data log-likelihood


%% Initialization
close all; clc; clear

%% ======================= Part 1: Inpute data ============================
fprintf('Running Q2 exercise ... \n');
q2x = csvread('q2x.dat');
q2y = csvread('q2y.dat');

X = q2x; t = q2y;
m = length(t); % number of training examples

%% ========================= Part 2: Initialization =======================
queryX = min(X):.2:max(X);
queryX = queryX';

queryM = size(queryX,1);
sigmas = [0.2, 0.5, 1, 2, 5];
betas = [0.01, 0.03, 0.1, 0.3];

mSigma = size(sigmas,2);
mBeta = size(betas,2);

likelihoods = zeros(mSigma * mBeta, 3);
k = 1;
%% ================== Part 3: compute likelihood ==========================

for i = 1: mSigma
    for j = 1: mBeta
        likelihoods(k,:) = [sigmas(i), betas(j), ...
            gpLikelihood(m, X, t, sigmas(i), betas(j))];
        k = k + 1;
    end
end

%% =========== Part 4: Plot curves using best parameter ===================

[variable, index] = max(likelihoods,[], 1);

[GPmeans, GPsigmas] = ...
    gpRegression(m, queryM, X, queryX, t,...
    likelihoods(index(3), 1), likelihoods(index(3), 2));