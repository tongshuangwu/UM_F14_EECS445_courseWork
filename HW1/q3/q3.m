
%% EECS 445 - HW 01 - Q3 KNN

%  Instructions
%  ------------
%  simple KNN method for recognizing numbers

%% Initialization
clear; close all; clc

%% ==================== Part 1: Basic Function ====================
fprintf('Running Q3 exercise ... \n');
load('q3_digits.mat');
fprintf('Program paused. Press enter to continue.\n');
pause;

%% ======================= Part 2: nearest neighbor =======================
fprintf('Running nearest neighbor for test example 1-5 ...\n')

for i = 1: 5
    nearestNeighbor_plot(i,8,digits_train,labels_train,digits_test,labels_test);
    fprintf('Program paused. Press enter to continue.\n');
    pause;
end

%% =================== Part 3: KNN ===================
fprintf('Running KNN for k=10 ...\n')

k = 10;
accuracy = knn(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
%% =================== Part 4: KNN test ===================
fprintf('Running KNN for accuracy test ...\n')

k = 2;
accuracy = knn(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 4;
accuracy = knn(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 6;
accuracy = knn(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 8;
accuracy = knn(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 10;
accuracy = knn(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 20;
accuracy = knn(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 50;
accuracy = knn(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 100;
accuracy = knn(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;



%% =================== Part 5: Improved KNN test ===================
fprintf('Running improved KNN for accuracy test ...\n')

k = 2;
accuracy = knnImprove(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 4;
accuracy = knnImprove(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 6;
accuracy = knnImprove(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 8;
accuracy = knnImprove(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 10;
accuracy = knnImprove(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 20;
accuracy = knnImprove(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 50;
accuracy = knnImprove(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;
k = 100;
accuracy = knnImprove(10,digits_train,labels_train,digits_test,labels_test)
% print theta to screen
fprintf('Accuracy: ');
fprintf('k = %d, %f \n', k,accuracy);
fprintf('Program paused. Press enter to continue.\n');
pause;