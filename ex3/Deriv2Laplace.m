function L = Deriv2Laplace(Ix, Iy)
%DERIV2LAPLACE Given the derivatives, computes the laplacian

    MODE = 'same';
    L = conv2(Ix, Kx, MODE) + conv2(Iy, Ky, MODE);

end

