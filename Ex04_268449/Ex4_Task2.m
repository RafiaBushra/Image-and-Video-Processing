%SGN-12007 Ex04T02 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

A1 = imread('house.png');
histequal(A1);
ContrastStretch(A1, 0, 250)
A2 = imread('moon.png');
histequal(A2);
ContrastStretch(A2, 0, 250)
A3 = imread('spine.jpg');
histequal(A3);
ContrastStretch(A3, 0, 250)
A4 = imread('church.png');
histequal(A4);
ContrastStretch(A4, 0, 250)