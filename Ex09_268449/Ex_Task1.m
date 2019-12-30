%SGN-12007 Ex09T01 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

I = imread("fruits.jpg");
% Apply histogram equalization on each color channel independently
for i = 1:3
    I1(:,:,i) = histeq(I(:,:,i));
end
I2 = intensityeq(I);

I3 = imread("festia.jpg");
% Apply histogram equalization on each color channel independently
for i = 1:3
    I4(:,:,i) = histeq(I3(:,:,i));
end
I5 = intensityeq(I3);

figure
subplot(231), imshow(I); title('Original');
subplot(232), imshow(I1); title('RGB equalized');
subplot(233), imshow(I2); title('HSV equalized');
subplot(234), imshow(I3); title('Orignal');
subplot(235), imshow(I4); title('RGB equalized');
subplot(236), imshow(I5); title('HSV equalized');

function I2 = intensityeq(I)
% Convert the image to HSV
I2 = rgb2hsv(I);
% Apply histogram equalization to the value component of the HSV image
I2(:,:,3) = histeq(I2(:,:,3));
% Convert the HSV image back to RGB
I2 = hsv2rgb(I2);
end