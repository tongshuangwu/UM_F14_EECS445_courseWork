% Note: This file gives no concrete logic for implementing kNN. It only contains
% sample useful code for accessing elements from the digits dataset and plotting
% them on matlab figures.
function [im] = plotNeighbor(index, neighborIndex,digits_test,digits_train ,labels_test)

%
% Show example im in its own figure:
im = digits_test(index, :, :);
im = reshape(im, 28, 28);
imshow(im);

%
% Print the class of image 300:
disp(sprintf('class label for example %i is %i', index ,labels_test(index)));

%
% Lastly, in a new figure, plot a bunch of images in a 2 x 3 rectangle:
figure(2);

im1 = reshape(digits_train(neighborIndex(1), :, :), 28, 28);
im2 = reshape(digits_train(neighborIndex(2), :, :), 28, 28);
im3 = reshape(digits_train(neighborIndex(3), :, :), 28, 28);
im4 = reshape(digits_train(neighborIndex(4), :, :), 28, 28);
im5 = reshape(digits_train(neighborIndex(5), :, :), 28, 28);
im6 = reshape(digits_train(neighborIndex(6), :, :), 28, 28);
im7 = reshape(digits_train(neighborIndex(7), :, :), 28, 28);
im8 = reshape(digits_train(neighborIndex(8), :, :), 28, 28);

subplot(2, 4, 1); imshow( im1 );
subplot(2, 4, 2); imshow( im2 );
subplot(2, 4, 3); imshow( im3 );
subplot(2, 4, 4); imshow( im4 );
subplot(2, 4, 5); imshow( im5 );
subplot(2, 4, 6); imshow( im6 );
subplot(2, 4, 7); imshow( im7 );
subplot(2, 4, 8); imshow( im8 );
end

