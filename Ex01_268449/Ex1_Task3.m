%SGN-12007 Ex01T03 268449

S = [0 0 0 0 0 0 0 1 1 0
      1 0 0 1 0 0 1 0 0 1
      1 0 0 1 0 1 1 0 0 0
      0 0 1 1 1 0 0 0 0 0
      0 0 1 1 1 0 0 1 1 1];
imshow(S)
S1 = [0 0 0 0 0
      1 0 0 1 0
      1 0 0 1 0
      0 0 1 1 1
      0 0 1 1 1];
S2 = [0 0 1 1 0
      0 1 0 0 1
      1 1 0 0 0
      0 0 0 0 0
      0 0 1 1 1];
load('S.mat', 'S');
fid = fopen('Task3Results.txt', 'w');
fprintf(fid, '%.d\n',non_zeros(S1), non_zeros(S2), non_zeros(S));
fclose(fid);

function result = non_zeros(S)
    result = sum(S(:));
end