function O = med_filter_thresh(I, k, A)   
% Calculates the median of each row and column of the image and replaces the middle
% value of the row and column with the median value. A is a threshold value which
% retains the original intensity of the pixel if the filtered intencity
% goes higher than A.
    O = I;
    for x = 1:k
        medx = median(I(x,:));
        O(x, size(I,1)/2) = medx;
        for y = 1:k
            medy = median(I(:,y));
            O(size(I,1)/2, y) = medy;
            if abs(I(x,y) - O(x,y)) > A
                O(x,y) = I(x,y);
            end
        end
    end
end