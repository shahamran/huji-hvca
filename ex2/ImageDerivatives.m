function [Ix, Iy, It] = ImageDerivatives(I1, I2)
%IMAGEDERIVATIVES Calculates the derivative of the given images
%   Parameters
%   ----------
%   I1 - one frame of an image
%   I2 - another frame (size identical to I1)
%   Returns
%   -------
%   Ix - the derivative of the frame on the x axis
%   Iy - the derivative of the frame on the y axis
%   It - the derivative of the frame over time
    
    % kernels and constants
    Ky = 0.25 * [-1, -1; 1,  1];
    Kx = -Ky';
    Kt = 0.25 * ones(2, 2);
    CONV_PARAM = 'same';
    % actual work
    Ix = conv2(I1, Kx, CONV_PARAM) ...
        + conv2(I2, Kx, CONV_PARAM);
    Iy = conv2(I1, Ky, CONV_PARAM) ...
        + conv2(I2, Ky, CONV_PARAM);
    It = conv2(I2, Kt, CONV_PARAM) ...
        - conv2(I1, Kt, CONV_PARAM);
    
end
