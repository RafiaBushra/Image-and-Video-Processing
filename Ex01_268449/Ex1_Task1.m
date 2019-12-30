%SGN-12007 Ex01T01 268449

%Task 1
I = imread('peppers.png');
I1 = rgb2gray(I);
%figure, imshow(img)
red = I(:,:,1);
green = I(:,:,2);
blue = I(:,:,3);
a = zeros(size(I, 1), size(I, 2));
just_red = cat(3, red, a, a);
%figure, imshow(just_red)
just_green = cat(3, a, green, a);
%figure, imshow(just_green)
just_blue = cat(3, a, a, blue);
%figure, imshow(just_blue)
I2 = I;
I2(:,:,2) = I2(:,:,2) + 50;
%figure, imshow(I2)
I3 = cat(3, blue, green, red);
%figure, imshow(I3)
subplot(2,2,1), imshow(I)
subplot(2,2,2), imshow(I1)
subplot(2,2,3), imshow(I2)
subplot(2,2,4), imshow(I3)

