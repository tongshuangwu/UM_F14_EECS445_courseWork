%% EECS 445 - HW 01 - Q1 Linear regression

%  Instructions
%  ------------
% For each of the following optimization methods, find the coefficients 
% (slope and intercept) that minimize the error for a first degree 
% polynomial.

% ? Batch gradient descent
% ? Stochastic gradient descent
% ? Newton¡¯s method (note that this is the same as closed-form solution we 
% covered in class)

%% Initialization
close all; clc

%% ==================== Part 1: Basic Function ====================
% Complete warmUpExercise.m 
fprintf('Running Q1 exercise ... \n');
q1xTrain = csvread('q1xTrain.dat');
q1yTrain = csvread('q1yTrain.dat');
q1xTest = csvread('q1xTest.dat');
q1yTest = csvread('q1yTest.dat');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ======================= Part 2: Plotting =======================
fprintf('Plotting Data ...\n')
X = q1xTrain; y = q1yTrain;
m = length(y); % number of training examples

% Plot Data
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;



%% =================== Part 3: Gradient descent - Batch ===================
fprintf('Running Batch Gradient Descent...\n')

X = [ones(m, 1), X]; % Add a column of ones to x
theta_batch = zeros(2, 1); % initialize w

% Some gradient descent settings
alpha = 0.01;

% compute and display initial cost
tic;
    computeCost(X, y, theta_batch)
toc;
% run gradient descent
theta_batch = gradientDescentBatch(X, y, theta_batch, alpha);

% print theta to screen
fprintf('Theta found by batch gradient descent: ');
fprintf('%f %f \n', theta_batch(1), theta_batch(2));

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta_batch, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure
fprintf('Program paused. Press enter to continue.\n');
pause;
%% =================== Part 4: Gradient descent-Stochastic ===================
fprintf('Running Stochastic Gradient Descent ...\n')

theta_sto = zeros(2, 1); % initialize fitting parameters

% Some gradient descent settings
alpha = 0.01;

% compute and display initial cost
computeCost(X, y, theta_sto)

% run gradient descent
tic;
    theta_sto = gradientDescentStochastic(X, y, theta_sto, alpha);
toc;
% print theta to screen
fprintf('Theta found by stochastic gradient descent: ');
fprintf('%f %f \n', theta_sto(1), theta_sto(2));

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta_sto, '-')
legend('Training data', 'Linear regression')
hold off % don't overlay any more plots on this figure

fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 5: Gradient descent-Close form ===================
fprintf('Running Close form Descent ...\n')

theta_close = zeros(2, 1); % initialize fitting parameters

% compute and display initial cost
computeCost(X, y, theta_close)
% run gradient descent
tic;
    theta_close = gradientDescentClose(X, y);
toc;
% print theta to screen
fprintf('Theta found by Close form Descent: ');
fprintf('%f %f \n', theta_close(1), theta_close(2));

% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta_close, '-')
legend('Training data', 'Linear regression')
hold off
fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 6: RMS Error - change M ===================
fprintf('Running fitting check for linear regression ...\n')

x_train = X(:,2);
y_train = y;
x_test = q1xTest;
y_test = q1yTest;
iters = 1:10;
error_train = zeros(iters,1);
error_test = zeros(iters,1);

% compute and display initial cost
[error_train, error_test]=computeError(x_train, x_test, y_train, y_test, error_train, error_test);

% Plot the linear fit
figure;
hold on; % keep previous plot visible
plot(iters, error_train, 'r')
plot(iters, error_test, 'b')
plot(iters, error_train, 'ro')
plot(iters, error_test, 'bo')

legend('Training', 'Test')
hold off
fprintf('Program paused. Press enter to continue.\n');
pause;


%% =================== Part 7: RMS Error - regularization ===================
fprintf('Running fitting check regularized linear regression ...\n')

lamda = [0 1e-6 1e-5 1e-4 1e-3 1e-2 1e-1 1];
iters = 1:length(lamda);
error_train_regu = zeros(iters,1);
error_test_regu = zeros(iters,1);

% compute and display initial cost
[error_train_regu, error_test_regu]=computeRegularization(x_train, x_test, y_train, y_test, error_train_regu, error_test_regu, lamda);

% Plot the linear fit
figure;
axis([-14 0 0 1]);
hold on; % keep previous plot visible
plot(log(lamda), error_train_regu, 'r')
plot(log(lamda), error_test_regu, 'b')
plot(log(lamda), error_train_regu, 'ro')
plot(log(lamda), error_test_regu, 'bo')

legend('Training', 'Test')
hold off
fprintf('Program paused. Press enter to continue.\n');
pause;