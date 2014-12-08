
%% EECS 445 - HW 04 - Q3 K-means for image compression

%  Declaration
%  ------------
%  Date: 2014 / 10 / 30
%  Author: WU Tongshuang, 40782306

%  used helper function
%  --------------------
%  kmean_train()

%  Instructions
%  ------------
%  run K-means with 16 clusters on the pixel data from this smaller image, 
%  iterating (preferably) to convergence, but in no case for less than 30 
%  iterations. For initialization, set each cluster centroid to the (r, g, 
%  b)-values of a randomly chosen pixel in the image.

%% Initialization
clear; close all; clc
%% =================== Part 0: run train func =============================

mu = kmean_train;