%SGN-12007 Ex02T01 268449

A = 0:255;
step = 256/4; % 4 levels?
QA1 = quant(A, step); % QA1 contains A values quantized to nearest multiple
                      % of 64. 0, 64, 128, 192, 256.
partition = step:step:256-step; % 64:64:192
codebook = step/2:step:256-step/2; % 32:64:224
[indx,QA2] = quantiz(A, partition, codebook); 
unique(QA1)
unique(QA2)