function plotRhombus(fatFlag, lambda, iters)
    contrasts = 0:0.02:1;
    horiz = zeros(numel(contrasts), 1);
    vert = horiz;
    for i = 1:numel(contrasts)
        contrast = contrasts(i);
        [r1, r2] = rhombusMovie(fatFlag, contrast);
        v = Full_LK(r1, r2, lambda, ones(size(r1)), iters);
        horiz(i) = v(1);
        vert(i) = v(2);
    end
    plot(contrasts, horiz);
    plot(contrasts, vert);
    xlabel('Contrast');
    ylabel('v value');
end

