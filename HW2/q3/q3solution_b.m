
%% EECS 445 - HW 02 - Q3_b Naive Bayes for finding indicative words

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
%  find the 5 tokens that are most indicative of the SPAM class (i.e., 
%  have the highest positive value on the measure above)

%% Initialization
clear; close all; clc

%% ======================= Part 1: Compute parameter ======================
fprintf('Compute parameter ... \n');
[token_index token_text] = textread('TOKENS_LIST','%d %s');
[phi_0, phi_1, phi_0_set, phi_1_set] = nb_train(0);
error = nb_test(phi_0, phi_1, phi_0_set, phi_1_set);

%% ======================= Part 2: find indicative token ==================
fprintf('Extracting indicative words ...\n')

indicator = phi_1_set - phi_0_set;
[indicator,index] = sort(indicator, 'descend');
index = index(1:5);
for i = 1: size(index,2)
    token_text(index(i))
end