%SGN-12007 Ex02T03 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

A = uint8(ones(400)*63);
subplot(1,2,1), imshow(A)
A(120:end-120,120:end-120) = 127;
imshow(A)
B = uint8(ones(400)*223);
B(120:end-120, 120:end-120) = 175;
subplot(1,2,2), imshow(B)
