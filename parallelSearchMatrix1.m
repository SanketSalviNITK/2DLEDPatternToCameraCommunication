function [heirSearch1,foundAt]=parallelSearchMatrix1(fromSet,dataStream)
toFindO=zeros(4,4);
toFindI=zeros(4,4);

%For Simulation
% toFindO(1:2,1:2)=state(dataStream(1),1);
% toFindO(1:2,3:4)=state(dataStream(2),2);
% toFindO(3:4,1:2)=state(dataStream(3),3);
% toFindO(3:4,3:4)=state(dataStream(4),4);
% toFindI(1:2,1:2)=state(dataStream(5),5);
% toFindI(1:2,3:4)=state(dataStream(6),6);
% toFindI(3:4,1:2)=state(dataStream(7),7);
% toFindI(3:4,3:4)=state(dataStream(8),8);


%For realtime testing
toFindO(1:2,1:2)=dataStream(1:2,1:2);
toFindO(1:2,3:4)=dataStream(1:2,7:8);
toFindO(3:4,1:2)=dataStream(7:8,1:2);
toFindO(3:4,3:4)=dataStream(7:8,7:8);
toFindI(1:2,1:2)=dataStream(3:4,3:4);
toFindI(1:2,3:4)=dataStream(3:4,5:6);
toFindI(3:4,1:2)=dataStream(5:6,3:4);
toFindI(3:4,3:4)=dataStream(5:6,5:6);

tic;
foundOat=simpleSearch(fromSet,toFindO);
foundIat=simpleSearch(fromSet,toFindI);
heirSearch1=toc;
if foundOat~=-1 && foundIat~=-1 
    foundAt=[dec2bin(foundOat-1,4) dec2bin(foundIat-1,4)]; 
else
    foundAt=-1;
end
%disp(foundOat);
%disp(foundIat);
end