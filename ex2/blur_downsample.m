function blurredI = blur_downsample(I)
%BLUR_DOWNSAMPLE Summary of this function goes here
%   Detailed explanation goes here

    kernel = load('GaussKernel.mat');
    I = conv2(I, kernel, 'same');
    blurredI = I(1:2:end, 1:2:end);
    
end

