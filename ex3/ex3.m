%% constants
Q4_IMAGE = 'simul_cont_squares.tif';
Q5_IMAGE = 'cross.tif';
Q6_IMAGE = 'kofka_ring.tif';

%% question 4
figure();
% read the image & compute laplacian (absolute value)
I = im2double(imread(Q4_IMAGE));
[m, n] = size(I);
[Ix, Iy] = ImageDerivatives(I);
L = abs(Deriv2Laplace(Ix, Iy));

% define the left/right parts of the image (exclude border ~ 10 pixels
%                                           in the middle)
leftL = L(1:end, 1:(n/2-5));
rightL = L(1:end, (n/2+5):end);

epsilon = 10;
T_space = (unique(L) - max(L(:))/10)';

for T = T_space
    if (length(find(leftL > T)) > epsilon) && ...
       (length(find(rightL > T)) <= epsilon)
        fprintf('Found T = %.2f\n', T);
        break;  % the result is T = 0.05 (approximately)
    end
end
fprintf('Number of pixels > T in the left image = %u\n', ...
        length(find(leftL > T)));  % == 1004
fprintf('Number of pixels > T in the right image = %u\n', ...
        length(find(rightL > T))); % == 4
show(L > T);
title(sprintf('Laplacian > T where T = %f', T));

%% question 5
figure();
I = im2double(imread(Q5_IMAGE));
[Ix, Iy] = ImageDerivatives(I);
L = abs(Deriv2Laplace(Ix, Iy));
Diag = logical(eye(length(L)));
Diag = Diag | rot90(Diag);
noDiag = not(Diag);
T_space = unique(L)';

for T = T_space
    if (~isempty(find(L(Diag) > T, 1))) && ...
         isempty(find(L(noDiag) > T, 1))
        fprintf('Found T = %.3f\n', T);
        break;
    end
end
% T = 0.017;

% show that this threshold is tight:
subplot(1, 2, 1);
show(L > T);
title(sprintf('Laplacian > T where T = %f', T));
subplot(1, 2, 2);
show(L > (T-0.001));
title(sprintf('Laplacian > T where T = %f', T-0.001));
% number of pixels > T on every part of the image
fprintf('Number of pixels > T on diagonal = %u\n', ...
    length(find(L(Diag) > T)));  % == 52
fprintf('Number of pixels > T NOT on diagonal = %u\n', ...
    length(find(L(noDiag) > T)));  % == 0

%% question 6
figure();
I = im2double(imread(Q6_IMAGE));
[Ix, Iy] = ImageDerivatives(I);
L = abs(Deriv2Laplace(Ix, Iy));

T_space = (min(L(:))+0.001):0.02:(max(L(:))/2); 
% size(T_space) == (1, 6)
rows = 2;
cols = 3;
i = 1;
for col = 1:cols
    for row = 1:rows
        subplot(rows, cols, i);
        T = T_space(i);
        i = i + 1;
        show(L > T);
        title(sprintf('T = %.3f', T));
    end
end

%% question 9
%% qeustion 10
%% question 11
%% question 12