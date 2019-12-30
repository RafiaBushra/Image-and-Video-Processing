%SGN-12007 Ex11T02 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

I = imread('lena.tiff');
Y = rgb2ycbcr(I);
subplot(131), imshow(Y(:,:,1));
subplot(132), imshow(Y(:,:,2));
subplot(133), imshow(Y(:,:,3));
y = Y(:,:,1);
Cb = Y(:,:,2);
Cr = Y(:,:,3);
% 4:2:2
Cb2 = Cb(:, 1:2:end);
Cr2 = Cr(:, 1:2:end);
% 4:2:1
Cb1 = Cb(:, 1:4:end);
Cr1 = Cr(:, 1:4:end);
% 4:2:0
Cb0 = Cb(1:2:end, 1:2:end);
Cr0 = Cr(1:2:end, 1:2:end);
% Subsampling luminance 4:2:0 format
y0 = y(1:2:end, 1:2:end);

% Upsampling the components back to original image size
Cb2 = imresize(Cb2, [512, 512]);
Cr2 = imresize(Cr2, [512, 512]);
Cb1 = imresize(Cb1, [512, 512]);
Cr1 = imresize(Cr1, [512, 512]);
Cb0 = imresize(Cb0, [512, 512]);
Cr0 = imresize(Cr0, [512, 512]);
y0 = imresize(y0, [512, 512]);

% Combining the components and converting to RGB
Y2 = ycbcr2rgb(cat(3, Cb2(:), Cr2(:), y(:)));
Y1 = ycbcr2rgb(cat(3, Cb1(:), Cr1(:), y(:)));
Y0 = ycbcr2rgb(cat(3, Cb0(:), Cr0(:), y(:)));
Y00 = ycbcr2rgb(cat(3, Cb0(:), Cr0(:), y0(:)));

figure
subplot(511), imshow(I); title('Original');
subplot(512), imshow(Y2); title('4:2:2');
subplot(513), imshow(Y1); title('4:2:1');
subplot(514), imshow(Y0); title('4:2:0');
subplot(515), imshow(Y00); title('Luminance subsampled');

fprintf('MSE for 4:2:2 = %d\n', immse(I, imresize(Y2, [512, 512])));
fprintf('MSE for 4:2:1 = %d\n', immse(I, imresize(Y1, [512, 512])));
fprintf('MSE for 4:2:0 = %d\n', immse(I, imresize(Y0, [512, 512])));
fprintf('MSE for subsampling luminance = %d\n', immse(I, imresize(Y00, [512, 512])));