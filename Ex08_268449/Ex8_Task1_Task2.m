%SGN-12007 Ex08T01 268449
clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.

I = double(imread('DIP.jpg'));
% Take the image to Fourier domain
Fc = fftshift(fft2(I));
% Create and apply the filter
H = filt(I, 1.0, 0.1, 0.1);
G = H.*Fc;
% Bring image back from Fourier domain
Bi = real(ifft2(ifftshift(G))); % Blurred Image
% Take the image to Fourier domain again for restoring
Ri = fftshift(fft2(Bi));
% Apply simple inverse filter
Ri = Ri./(H + 0.001);
% Take image back to frequency domain
Ri = ifft2(ifftshift(Ri));
Ri = real(Ri); % Restored Image
% Show the images in a row subplot and print Mean Squared Error in Console
subplot(131), imshow(I, []);
subplot(132), imshow(Bi, []); 
subplot(133), imshow(Ri, []); 
fprintf('%d error margin for blurred image\n',immse(I, Bi));
fprintf('%d error margin for restored image\n',immse(I, Ri));
%%
%SGN-12007 Ex08T02 268449
% Noise function
N = 50*randn(size(Bi));
% Apply noise filter to the Blurred image
Ni = Bi + N; % Noisy Image
Ninv = real(Ni./(H + 0.001)); % Simple inverse filtered image
% Take image to Fourier domain 
Wi = fftshift(fft2(Ni));
% Create Wiener filter
Sn = N.^2; % Power spectrum of noise
Sf = abs(Fc).^2; % Power spectrum of original image
k = Sn./Sf; % Noise-to-signal ratio
W = (1./(H + 0.001)).*(((H.^2)./(H.^2 + k))).*Wi; % Wiener filter
% Apply the filter and take back to frequency domain
G = W .* Wi;
Wi = real(ifft2(ifftshift(G))); % Wiener filtered image
figure
subplot(131), imshow(Ni, []);
subplot(132), imshow(Ninv, []);
subplot(133), imshow(Wi, []);
%%
function H = filt(I, T, a, b)
    row = size(I, 1);
    col = size(I, 2);
    [u, v] = meshgrid(-row/2:row/2-1, -col/2:col/2-1);
    H = T./(pi*(u*a + v*b) + 0.001).*sin(pi*(u*a + v*b)).*exp(-1i*pi*(u*a + v*b));
end

