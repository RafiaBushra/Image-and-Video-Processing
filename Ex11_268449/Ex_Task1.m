%SGN-12007 Ex11T01 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

YuvToRgb = [1  0        1.402;
            1 -0.34413 -0.71414;
            1  1.772    0       ];
 
load yuvdata.mat
Y = reshape(yy, [cols, rows])';
U = reshape(uu, [cols/2, rows/2])';
U = imresize(U, 2);
V = reshape(vv, [cols/2, rows/2])';
V = imresize(V, 2);
subplot(131), imshow(uint8(Y));
subplot(132), imshow(uint8(U));
subplot(133), imshow(uint8(V));

U = U - 127;
V = V - 127;
YUV = cat(2, Y(:), U(:), V(:));
RGB = YuvToRgb*YUV';
R = RGB(1, :);
G = RGB(2, :);
B = RGB(3, :);
R = reshape(R, [rows cols]);
G = reshape(G, [rows cols]);
B = reshape(B, [rows cols]);
RGB = cat(3, R, G, B);
figure, imshow(uint8(RGB))
