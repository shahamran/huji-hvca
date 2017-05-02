function v = Full_LK(I1, I2, lambda, mask, num_iterations)
%FULL_LK Summary of this function goes here
%   Detailed explanation goes here

    v = [0; 0];
    I1b = blur_downsample(I1);
    I2b = blur_downsample(I2);
    v = LK_alg(I1b, I2b, lambda, mask, v, 1);
    v = LK_alg(I1, I2, lambda, mask, v .* 2, num_iterations);

end

