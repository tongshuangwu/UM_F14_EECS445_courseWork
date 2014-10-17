
%% EECS 445 - HW 02 - Q3_a Naive Bayes

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

%% ======================= Part 1: Compute parameter ======================
fprintf('Compute parameter ... \n');
[phi_0, phi_1, phi_0_set, phi_1_set] = nb_train(0);

%% ======================= Part 2: compute accuracy =======================
fprintf('Compute accuracy for test ...\n')
error = nb_test(phi_0, phi_1, phi_0_set, phi_1_set);
fprintf('Computed error: %f \n',error);
