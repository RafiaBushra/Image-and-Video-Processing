%SGN-12007 Ex05T01 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

I = imread('cameraman.tif');
subplot(2, 2, 1), imshow(I); title('Original Image');

% Creating an averaging filter
x = [1 1 1;1 1 1;1 1 1]/9;
f_avg = imfilter(I, x);
% Converting A to a normal array
A = {8, 9, 9.7};
A = cell2mat(A);

for k = 1:3
    a = A(k);
    u = [-1, -1, -1;-1, a, -1;-1, -1, -1];
    f_high = imfilter(I, u) + f_avg;
    subplot(2, 2, k+1), imshow(f_high); title(sprintf('Filtered with center value %d', a));
end