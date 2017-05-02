function  v = LK_alg(I1, I2, lambda, mask, ...
                     v_initial, num_iterations)
%LK_ALG Summary of this function goes here
%   Detailed explanation goes here
    At = zeros(size(I1,1), size(I1,2), 4);
    Bt = zeros(size(I1,1), size(I1,2), 2);
    v = v_initial;
    for i = 1:num_iterations
        [I2w, warpMask] = warp(I2, v);
        mask = mask .* warpMask;
        [Ix, Iy, It] = ImageDerivatives(I1, I2w);
        Ix = Ix .* mask;
        Iy = Iy .* mask;
        It = It .* mask;
        At(:, :, 1) = Ix .^ 2;
        At(:, :, 2) = Ix .* Iy;
        At(:, :, 3) = At(:, :, 2);
        At(:, :, 4) = Iy .^ 2;
        Bt(:, :, 1) = Ix .* It;
        Bt(:, :, 2) = Iy .* It;
        A = reshape(sum(sum(At, 1), 2), 2, 2) + eye(2) .* lambda;
        B = -reshape(sum(sum(Bt, 1), 2), 2, 1);
        v = A \ B;
    end

end
