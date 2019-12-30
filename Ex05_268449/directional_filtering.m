function directional_filtering(I,k)
% Calculates and applies 4 directional filters of 0, 45, 90 and 135 degree.
% I = Original image. k = filter size.
    % 0-degree filter example: 
    % 0 0 0
    % 1 1 1
    % 0 0 0
    f0 = zeros(k,k);    
    f0(floor(k/2) + 1, :) = f0(floor(k/2) + 1, :) + ones(1, k);
    f0 = f0/k;
    I0 = imfilter(I, f0);
    % 45-degree filter example:
    % 0 0 1
    % 0 1 0
    % 1 0 0
    subplot(221), imshow(I0); title(sprintf('0-degree filter at k = %d', k));
    f45 = zeros(k,k);
    f45 = f45 + rot90(diag(ones(k, 1)));
    f45 = f45/k;
    I45 = imfilter(I, f45);
    subplot(222), imshow(I45); title('45-degree filter');
    % 90-degree filter example:
    % 0 1 0
    % 0 1 0
    % 0 1 0
    f90 = zeros(k,k);
    f90(:, floor(k/2) + 1) = f90(:, floor(k/2) + 1) + ones(k, 1);
    f90 = f90/k;
    I90 = imfilter(I, f90);
    subplot(223), imshow(I90); title('90-degree filter');
    % 135-degree filter example:
    % 1 0 0
    % 0 1 0
    % 0 0 1
    f135 = zeros(k, k);
    f135 = f135 + diag(ones(k, 1));
    f135 = f135/k;
    I135 = imfilter(I, f135);
    subplot(224), imshow(I135); title('135-degree filter');
    % Combining the 4 filtered images to create an average.
    Iout = double(I0) + double(I45) + double(I90) + double(I135);
    Iout = uint8(Iout/4);
    figure, imshow(Iout); title(sprintf('Average image at k = %d', k));
end
