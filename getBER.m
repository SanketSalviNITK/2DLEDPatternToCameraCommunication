function [sBer, txLen]=getBER(txString,rxString)
startChar=rxString(1,1);
%disp("TxString:"+txString);
%disp("StartChar:"+startChar);
[~,txLen]=size(txString);
[~,rxLen]=size(rxString);
%disp("txLen:"+txLen);
%disp("rxLen:"+rxLen);
txS=txString;
while rxLen>txLen
txString=strcat(txString,txS);
[~,txLen]=size(txString);
end
txString=extractBetween(txString,startChar,txLen,'Boundaries','inclusive');
disp(txLen);
disp(rxLen);
%if rxLen>txLen

%    [~,txLen]=size(txString);
txString=string(txString);
txString=convertStringsToChars(txString);
disp(txString);
txString=txString(1:end-(txLen-rxLen));
disp(txString);
% %disp(class(txString));
disp(rxString);
% %disp(class(rxString));
txDec=double(txString);
rxDec=double(rxString);
% 
% %disp("TxString");
disp(txDec);
% %disp("RxString");
disp(rxDec);
% % 
[dis]=editDistance(txString,rxString);
%disp(dis);
%disp(xi.');
%disp(yi.');
sBer=dis*8;
disp("BER:"+sBer);
end