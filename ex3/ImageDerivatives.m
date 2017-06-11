function [Ix, Iy] = ImageDerivatives(I)
%IMAGEDERIVATIVES Returns the image x,y derivatives
    
    % convolution parameter
    MODE = 'full';
    % preallocate empty matrices
    Ix = zeros(size(I));
    Iy = zeros(size(I));
    % compute the derivatives
    Dx = conv2(I, Kx, MODE);
    Dy = conv2(I, Ky, MODE);
    % discard last column/row and zero out borders
    Ix(2:(end-1), 2:(end-1)) = Dx(2:(end-1), 2:(end-2));
    Iy(2:(end-1), 2:(end-1)) = Dy(2:(end-2), 2:(end-1));
    
end

