%SGN-12007 Ex04T01 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

A = imread("university.png");
r = double(A);
C = 45;
S = C*log(1+r);
S1 = uint8(S);
G = 0.35;
C = 50;
S = C*(r.^G);
S2 = uint8(S);
subplot(3, 1, 1), imshow(A); title('Original pic');
subplot(3, 1, 2), imshow(S1); title(sprintf('Log Transformation -> S = clog(1+r), c = %d', C));
subplot(3, 1, 3), imshow(S2); title(sprintf('Gamma corrected Image -> S = cr^\\gamma  \\gamma = %f, c = %d', G, C));