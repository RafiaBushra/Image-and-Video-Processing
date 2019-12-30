%SGN-12007 Ex05T03 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

I = imread('miranda1.tif');
% Adding a 100x100 white noise to the very center of the image.
I(150:end-151, 150:end-151) = I(150:end-151, 150:end-151) + uint8(10*randn(100));

subplot(221), imshow(I); title('Original');
subplot(222), imshow(med_filter(I, 30)); title('30');
subplot(223), imshow(med_filter(I, 3)); title('3');
subplot(224), imshow(med_filter(I, 100)); title('100');