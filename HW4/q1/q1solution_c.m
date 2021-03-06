
%% EECS 445 - HW 04 - Q3 K-means for image compression

%  Declaration
%  ------------
%  Date: 2014 / 10 / 30
%  Author: WU Tongshuang, 40782306

%  used helper function
%  --------------------
%  kmean_train
%  kmean_assign

%  Instructions
%  ------------
%  TakethematrixAfrommandrill-large.tiff,andreplaceeachpixel��s(r,g,b) 
%  values with the value of the closest cluster centroid. Display the new 
%  image, and compare it visually to the original image. 

%% Initialization
clear; close all; clc
%% ============= Part 0: run train and assignfunc =========================

mu = kmean_train;
kmean_assign(mu);