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
REAL_VELOCITY = 1;
L2_DIFF = 2;

squareSize = 128;
sigmas = [10, 1];
%lambda = 0.001;
lambda = 0;
mask = ones(squareSize);
num_iterations = 1;
maxVelocity = squareSize / 3;
velocities = (-maxVelocity):maxVelocity;
results = zeros(length(velocities), 2);

hold on;
for sigma = sigmas
    firstFrame = GausSpot(squareSize, sigma, [0, 0]);
    for i = 1:numel(velocities)
        real_v = velocities(i);
        secondFrame = GausSpot(squareSize, sigma, [real_v, 0]);
        estimated_v = Full_LK(firstFrame, secondFrame, lambda, ...
                              mask, num_iterations);
        results(i, REAL_VELOCITY) = real_v;
        % the L2 norm of a scalar is the abs value
        results(i, L2_DIFF) = abs(estimated_v(1) - real_v);
    end
    plot(results(:, REAL_VELOCITY), results(:, L2_DIFF));
end
hold off;
title({'LK estimation error on a gaussian spot', ...
       ['\lambda = ', num2str(lambda)], ...
       [' Square size = ', num2str(squareSize)]});
xlabel('True Velocity');
ylabel({'Estimation Error', '(L_2 norm of difference)'});
legend(['\sigma = ', num2str(sigmas(1))], ...
       ['\sigma = ', num2str(sigmas(2))]);

%% question 7
THIN = 0;
FAT = 1;
lambda = 0.01;
contrasts = 1:-0.2:0;
iters = [5, 25, 125];

result = zeros(numel(contrasts), numel(iters), 2);
for i = 1:numel(contrasts)
    contrast = contrasts(i);
    for k = [THIN, FAT]
        [rhom1, rhom2] = rhombusMovie(k, contrast);
        mask = ones(size(rhom1));
        for j = 1:numel(iters)
            iter = iters(j);
            v = Full_LK(rhom1, rhom2, lambda, mask, iter);
            results(i, j, k+1) = v;
        end
    end
end
plot(contrasts, results(:, 1, 1));
figure;plot(contrasts, results(:, 1, 2));