
%% EECS 445 - HW 01 - Q2 Locally weighted linear regression

%  Instructions
%  ------------
% For Locally weighted linear regression


%% Initialization
close all; clc

%% ==================== Part 1: Basic Function ====================
fprintf('Running Q2 exercise ... \n');
q2x = csvread('q2x.dat');
q2y = csvread('q2y.dat');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ======================= Part 2: Plotting =======================
fprintf('Plotting Data ...\n')
X = q2x; y = q2y;
m = length(y); % number of training examples

% Plot Data
plotData(X, y);
fprintf('Program paused. Press enter to continue.\n');
pause;

%% =================== Part 3: unweighted linear regression ===================
X = [ones(m, 1), X]; % Add a column of ones to x
fprintf('Running unweighted linear regression ...\n')

% run gradient descent
theta_close = gradientDescentClose(X, y);
% print theta to screen
fprintf('Theta found by Close form Descent: ');
fprintf('%f %f \n', theta_close(1), theta_close(2));
output01 = computeResultWeight(X, y, 0.8);
% Plot the linear fit
hold on; % keep previous plot visible
plot(X(:,2), X*theta_close, '-')
plot(X(:,2), output01, 'c.')
legend('Training data', 'Linear regression','而=0.8')
hold off % don't overlay any more plots on this figure

fprintf('Program paused. Press enter to continue.\n');
pause;


%% =================== Part 4: Gradient descent-Close form ===================
fprintf('Running weighted linear regression ...\n')
theta_weight = zeros(2, 1); % initialize fitting parameters
gama = 0.1;

% run gradient descent
output01 = computeResultWeight(X, y, 0.1);
output03 = computeResultWeight(X, y, 0.3);
output2 = computeResultWeight(X, y, 2);
output10 = computeResultWeight(X, y, 10);
% print theta to screen
fprintf('Theta found by Close form Descent: ');
fprintf('%f %f \n', theta_weight(1), theta_weight(2));

% Plot the linear fit
figure;
hold on; % keep previous plot visible
plot(X(:,2), y, 'rx')
plot(X(:,2), output01, 'c.')
plot(X(:,2), output03, 'g.')
plot(X(:,2), output2, 'b.')
plot(X(:,2), output10, 'y.')

legend('Training data', '而=0.1','而=0.3','而=2','而=10')
hold off % don't overlay any more plots on this figure

fprintf('Program paused. Press enter to continue.\n');
pause;