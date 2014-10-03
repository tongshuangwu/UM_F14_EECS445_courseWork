% Note: This file gives no concrete logic for implementing kNN. It only contains
% sample useful code for accessing elements from the digits dataset and plotting
% them on matlab figures.

load q3_digits  % Loads digits_train, labels_train, digits_test and labels_test

%
% Show example 300 in its own figure:
im = digits_train(300, :, :);
im = reshape(im, 28, 28);
imshow(im);

%
% Print the class of image 300:
disp(sprintf('class label for example 300 is %i', labels_train(300)));

%
% Lastly, in a new figure, plot a bunch of images in a 2 x 3 rectangle:
figure(2);
im1 = reshape(digits_train(300, :, :), 28, 28);
im2 = reshape(digits_train(301, :, :), 28, 28);
im3 = reshape(digits_train(302, :, :), 28, 28);
im4 = reshape(digits_train(303, :, :), 28, 28);
im5 = reshape(digits_train(304, :, :), 28, 28);
im6 = reshape(digits_train(305, :, :), 28, 28);

subplot(2, 3, 1); imshow( im1 );
subplot(2, 3, 2); imshow( im2 );
subplot(2, 3, 3); imshow( im3 );
subplot(2, 3, 4); imshow( im4 );
subplot(2, 3, 5); imshow( im5 );
subplot(2, 3, 6); imshow( im6 );


