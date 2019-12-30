%SGN-12007 Ex05T02 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

I = imread('cameraman.tif');
b = I + uint8(10*randn(size(I)));
subplot(211), imshow(I); title('Original');
subplot(212), imshow(b); title('Noisy');

figure, directional_filtering(b, 3);
figure, directional_filtering(b, 5);
figure, directional_filtering(b, 7);
