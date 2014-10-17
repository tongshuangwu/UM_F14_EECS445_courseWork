function [phi,u0,u1,cov] = computeParameter(x_train, t_train, N_train, m)
% EECS 445 HW2_Q1_d helper function
% Using the M.L.E of the parameters given in part (b), 
% compute each parameter¡¯s value 

x_positive = x_train(t_train==1, :);
x_negative = x_train(t_train==0, :);
N_positive = size(x_positive,1);
N_negative = size(x_negative,1);

phi = N_positive / N_train;
u1 = sum(x_positive) / N_positive;
u0 = sum(x_negative) / N_negative;
u  = [u0; u1];

cov = zeros(m,m);
for i = 1:N_train
    cov_element = (x_train(i,:)' - u(t_train(i)+1,:)');
    newMatrix = cov_element * cov_element';
    cov = cov + newMatrix;
end

cov = cov ./ N_train;
end
