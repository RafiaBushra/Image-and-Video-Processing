%SGN-12007 Ex01T02 268449

function [] = Ex1_batch()
    for i = 1:6
        name_in = strcat('c_', num2str(i), '.jpg');
        name_out = strcat('c_', num2str(i), '.bmp');
        I = imread(name_in);
        resultI = Process(I);
        imwrite(resultI, name_out);
    end
end

function resultI = Process(I)
    resultI = imresize(I, 0.75);
    resultI = fliplr(resultI(:,size(I,2)/2:end,:));
    resultI = imrotate(resultI, 90);
end