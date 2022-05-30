K = 3;
G1 = 7;
G2 = 5;
msg = [1 1 0 1];
trel = poly2trellis(K,[G1 G2]);
coded = convenc(msg,trel);

%coded=rsenc(coded,1,1)
%fromSet=generateMatrices(8);
%[~,b]=searchMatrix(fromSet,coded);
%decoded=rsdec(coded,1,1)
tblen = length(msg);
decoded = vitdec(coded,trel,tblen,'trunc','hard')