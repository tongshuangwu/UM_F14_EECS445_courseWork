
%% EECS 445 - HW 04 - Q2 Cross-Validation on Hyper-Parameters of SVM

%  Declaration
%  ------------
%  Date: 2014 / 10 / 30
%  Author: WU Tongshuang, 40782306

%  used helper function
%  --------------------
%  SVMStoGradient(C, n0, x_train, t_train, w, b, NumIterations)
%  SVMPredict(x_test, t_test,N_test, w, b)

%  Instructions
%  ------------
%  Implement ¡°k-fold cross validation¡± using k = 10, known as 10-fold 
%  validation. Try all pairs of C and ?0 where C 2 {0.01, 0.1, 1, 10, 100, 
%  1000} and ?0 2 {0.01, 0.5, 1.0, 10, 100}. Run 200 iterations of SGD for
%  each combination of C and ?0. Report the C and ?0 that minimize the 
%  validation error. Finally, using those cross validated hyper-parameters, 
%  train your SVM using the entire training set then compute and report 
%  the test error (i.e. number of mis-classified test examples).  

%% Initialization
clear; close all; clc
%% ======================== Part 0: Load data =============================
fprintf('Running HW4 Q2b exercise ... \n');
load('q2_data.mat');
x_train = q2x_train; t_train = q2t_train;
x_test = q2x_test; t_test = q2t_test;

N_train = size(x_train, 1); % the number of training examples
N_test = size(x_test, 1);   % the number of test examples

N_test_cross = round(N_train / 10);
N_train_cross = N_train - N_test_cross;

m = size(x_train, 2);       % the dimention of x

C = [0.01, 0.1, 1, 10, 100, 1000];
n0 = [0.01, 0.5, 1.0, 10, 100];
NumIterations = 200;

hyperPara = zeros(25,7);
bestPara = 0;
bestAccuracy = 0;

terms = zeros(36,3);

%% ======================= Part 1: Compute parameter ======================
fprintf('Compute parameter ... \n');
for j = 1:size(n0,2)
    for i = 1:size(C,2)
        aveAccuracy = 0;
        for k = 1:10
            b = 0;
            w = zeros(m,1);
            % split data
           startPoint = (k-1)*N_test_cross;
           endPoint = (k)*N_test_cross;
            x_test_cross = x_train(startPoint+1:endPoint,:);
            t_test_cross = t_train(startPoint+1:endPoint,:);
            x_train_cross = [];
            t_train_cross = [];
            if (startPoint > 1)
                x_train_cross = [x_train_cross; x_train(1:startPoint,:)];
                t_train_cross = [t_train_cross; t_train(1:startPoint,:)];
            end
            if (endPoint < N_train)
                x_train_cross = [x_train_cross; ...
                        x_train(endPoint+1:N_train,:)];
                t_train_cross = [t_train_cross; ...
                        t_train(endPoint+1:N_train,:)];
            end
            [w_sto, b_sto] = SVMStoGradient(C(i), n0(j), x_train_cross,...
                t_train_cross, N_train_cross, w, b, NumIterations);
%% ======================= Part 2: compute accuracy =======================
            accuracy_sto = SVMPredict(x_test_cross, t_test_cross,...
                N_test_cross, w_sto, b_sto);
            aveAccuracy = accuracy_sto + aveAccuracy;
        end
        aveAccuracy = aveAccuracy / 10  ;
        terms(i*j,:) = [n0(j), C(i), aveAccuracy];
        if(aveAccuracy > bestAccuracy)
            bestAccuracy = aveAccuracy;
            C_best = C(i);
            n0_best = n0(j);
        end
    end
end


fprintf...
    ('Hyper-parameter: C = %f, n0 = %f, with validation error e = %f ...\n'...
    ,C_best, n0_best, 1-bestAccuracy);
%% ======================= Part 3: train whole set ========================
fprintf('Compute parameter using the best C and eta... \n');
b = 0;
w = zeros(m,1);
[w_sto, b_sto] = SVMStoGradient(C_best, n0_best, x_train,...
            t_train, N_train, w, b, NumIterations)
        
%% ======================= Part 4: compute accuracy =======================
fprintf('Compute accuracy for test ...\n')
accuracy_sto = SVMPredict(x_test, t_test,N_test, w_sto, b_sto);
test_error = 1 - accuracy_sto