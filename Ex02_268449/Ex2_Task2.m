%SGN-12007 Ex02T02 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.
I = imread('lena_face.png');
figure, imshow(I)
figure
i = 1;
for level = [128, 64, 32, 16, 8, 4]
    subplot(3, 2, i), imshow(quantfunc(level, I), [])
    i = i+1;
end
b = I + uint8(10*randn(size(I)));
figure, imshow(b)
figure
subplot(2, 1, 1), imshow(quantfunc(16, I), [])
subplot(2, 1, 2), imshow(quantfunc(16, b), [])

function QA = quantfunc(level, I)
    step = 256/level;
    partition = step:step:256-step; 
    codebook = step/2:step:256-step/2; 
    [~,QA] = quantiz(I(:), partition, codebook);
    QA = reshape(QA, [256, 256]);
    QA = uint8(QA);
end

