%SGN-12007 Ex09T02 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

I = imread('lake.jpg');
% Converting the image to gray color space
level = graythresh(I);
BW = im2bw(I, level);
% Labeling the largest lake region
L = bwlabel(1-BW);
% The intensity of the largest lake is 820 so we find all the indexes 
% of the labeled image where the intensity is 820. This will give us
% the exact indices of the largest lake.
ind = (L==820);
% Create a replicate of the lake in 3 channels so we can convert
% the image back to RGB
mask = repmat(ind,[1,1,3]);
% Create a new 'blank' canvas to put the replicated lake image on.
new_I = zeros(size(I));
% Insert the original colors of the lake into the image. 
new_I(mask)  = I(mask);
figure
subplot(121), imshow(I); title('Original');
subplot(122), imshow(uint8(new_I)); title('Extracted image');
