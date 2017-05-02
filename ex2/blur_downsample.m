function blurredI = blur_downsample(I)
%BLUR_DOWNSAMPLE Reduces image size by a factor of 2
%   Parameters
%   ----------
%   I - an image
%   Returns
%   -------
%   blurredI - a blurred and downsampled image (half the size of I)

    kernel = load('GaussKernel.mat');
    kernel = kernel.GaussKernel;
    I = conv2(I, kernel, 'same');
    blurredI = I(1:2:end, 1:2:end);
    
end

