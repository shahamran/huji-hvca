function [R, L] = do_retinex(I, T)
%DO_RETINEX run the retinex algorithm with a given image I and threshold T

    % take the log of I and compute its derivative
    logI = log(I);
    [Ix, Iy] = ImageDerivatives(logI);
    % zero out values where norm < T
    normI = (Ix.^2 + Iy.^2).^0.5;
    smallerThanT = normI < T;
    Ix(smallerThanT) = 0;
    Iy(smallerThanT) = 0;
    % compute the laplacian and convolve with the inverse laplacian kernel
    L = Deriv2Laplace(Ix, Iy);
    Ka = invDel2(size(I));
    logR = conv2(L, Ka, 'same');
    % get the `real' reflectance and illumination
    R = exp(logR);
    L = I ./ R;

end

