function [Ix, Iy, It] = ImageDerivatives(I1, I2)
%IMAGEDERIVATIVES Calculates the derivative of the given images
    
    % kernels and constants
    Ky = 0.25 * [-1, -1; ...
                  1,  1];
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
