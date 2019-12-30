function O = med_filter(I, k)   
% Calculates the median of each row of the image and replaces the middle
% value of the row with the median value.
    O = I;
    for x = 1:k
        med = median(I(x,:));
        O(x, size(I,1)/2) = med;
        for y = 1:k
            medy = median(I(:,y));
            O(size(I,1)/2, y) = medy;
        end
    end
end