
%% EECS 445 - HW 02 - Q3_c Naive Bayes for different trainig set size

%  Declaration
%  ------------
%  Date: 2014 / 10 / 02
%  Author: WU Tongshuang, 40782306

%  used helper function
%  --------------------
%  nb_train(range)
%  nb_test(range, phi_0, phi_1, phi_0_set, phi_1_set)

%  Instructions
%  ------------
%  Implement a naive Bayes classier for spam classification, using the 
%  multinomial event model and Laplace smoothing

%% Initialization
clear; close all; clc
errors = zeros(6,2);
trainSet = [50, 100, 200, 400, 800, 1400];
%% ======================= Part 1: Compute parameter ======================
fprintf('Compute error ... \n');

for i =1:size(trainSet,2)
    [phi_0, phi_1, phi_0_set, phi_1_set] = nb_train(trainSet(i));
    error = nb_test(phi_0, phi_1, phi_0_set, phi_1_set);
    errors(i,1) = trainSet(i);
    errors(i,2) = error;
end
errors

%% ======================= Part 2: plot error =======================
fprintf('Plot error ...\n')
plot(errors(:,1), errors(:,2),'-o');
