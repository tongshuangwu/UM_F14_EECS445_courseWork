function [accuracy] = computeTest(x_test, t_test, N_test, phi, u0, u1, cov)
% EECS 445 HW2_Q1_d helper function
% use your result and your answer in (a) to classify test data. 
% Report your test accuracy.

covU0 = cov \ u0';
covU1 = cov \ u1';
w1 = -log(1/phi-1) + 1/2 * (u0 * covU0 - u1 * covU1);
w2 = covU1 - covU0;
w  = [w1 ; w2];
x0 = ones(N_test,1);

x_compute = [x0 x_test];
accuracy = 0;

p = 1./(1+exp(-x_compute*w));
for i = 1: N_test
   if(round(p(i)) == t_test(i))
       accuracy = accuracy + 1;
   end
end
accuracy = accuracy / N_test;

end
