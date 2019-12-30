%SGN-12007 Ex04T02 268449
function histequal(A)
% An implementation of Matlab's histeq function.

    %Specify the bin range[0 255]
    bin = 255;
    %Find the histogram of the image.
    Val = reshape(A, [], 1);
    Val = double(Val);
    I = hist(Val, 0:bin);
    %Divide the result by number of pixels
    Output = I/ numel(A);
    %Calculate the cumulative sum
    CSum = cumsum(Output);
    %Perform the transformation S = T(R) where S and R in the range [ 0 1]
    HIm = CSum(A+1);
    %Convert the image into uint8
    HIm = uint8(HIm*bin);
    figure;
    subplot(221), imshow(uint8(A)), title('Original Image');
    subplot(222), imhist(uint8(A), gray(256)), title('Histogram');
    subplot(223), imshow(uint8(HIm)), title('Histequal Image');
    subplot(224), imhist(uint8(HIm), gray(256)), title('Histogram');

end