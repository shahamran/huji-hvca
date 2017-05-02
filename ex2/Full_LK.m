function v = Full_LK(I1, I2, lambda, mask, num_iterations)
%FULL_LK The full version of the algorithm
%   for parameters reference see LK_alg.m

    % get the initial guess
    v = [0; 0];
    I1b = blur_downsample(I1);
    I2b = blur_downsample(I2);
    v = LK_alg(I1b, I2b, lambda, mask(1:2:end, 1:2:end), v, 1);
    % run the algorithm with the initial guess
    v = LK_alg(I1, I2, lambda, mask, v.*2, num_iterations);

end

