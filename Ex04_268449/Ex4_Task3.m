%SGN-12007 Ex04T03 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

A = imread('corel.png');
B = imread('spine.jpg');
result = histmatch(A, B);
subplot(311), imshow(A); title('Corel.png');
subplot(312), imshow(B); title('Spine.jpg');
subplot(313), imshow(result); title('Histogram Matched image');
function out = histmatch(A, B)
    % Initialize mapping
    M = zeros(256,1,'uint8');
    % Compute histograms
    histA = imhist(A); 
    histB = imhist(B);
    % Compute CDF's
    cdfA = cumsum(histA) / numel(A); 
    cdfB = cumsum(histB) / numel(B);    
    % Compute the mapping
    for idx = 1 : 256
        [~,ind] = min(abs(cdfA(idx) - cdfB));
        M(idx) = ind-1;
    end
    % Apply the mapping to A to make it look like the distribution of B
    out = M(double(A)+1);
end