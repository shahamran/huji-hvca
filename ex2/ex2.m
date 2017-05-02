%% question 5
% read images and view them
I1 = im2double(imread('flower-i1.tif'));
I2 = im2double(imread('flower-i2.tif'));
mymovie(I1, I2);

% define the algorithm's parameters
treeMask = zeros(size(I1));
treeMask(10:50, 90:130) = 1;
flowersMask = zeros(size(I1));
flowersMask(90:end, 1:90) = 1;
lambda = 0;
num_iterations = 100;

% run LK once on the tree and once on the flowers
v_tree = Full_LK(I1, I2, lambda, treeMask, num_iterations)
% v_tree = [-2.6017; -0.7671]

v_flowers = Full_LK(I1, I2, lambda, flowersMask, num_iterations)
% v_flowers = [-1.1675, -0.0010]

%% question 6
squareSize = 128;
sigmas = [10, 1];

%% question 7