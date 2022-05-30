function [linearSearchTime,foundAt]=searchMatrix(fromSet,dataStream)
foundAt=-1;
toFind=zeros(8,8);
%%for Simulation
% toFind(1:2,1:2)=state(dataStream(1),1);
% toFind(1:2,7:8)=state(dataStream(2),2);
% toFind(7:8,1:2)=state(dataStream(3),3);
% toFind(7:8,7:8)=state(dataStream(4),4);
% toFind(3:4,3:4)=state(dataStream(5),5);
% toFind(3:4,5:6)=state(dataStream(6),6);
% toFind(5:6,3:4)=state(dataStream(7),7);
% toFind(5:6,5:6)=state(dataStream(8),8);

%For Realtime Testing
 toFind(1:2,1:2)=dataStream(1:2,1:2);
 toFind(1:2,7:8)=dataStream(1:2,7:8);
 toFind(7:8,1:2)=dataStream(7:8,1:2);
 toFind(7:8,7:8)=dataStream(7:8,7:8);
 toFind(3:4,3:4)=dataStream(3:4,3:4);
 toFind(3:4,5:6)=dataStream(3:4,5:6);
 toFind(5:6,3:4)=dataStream(5:6,3:4);
 toFind(5:6,5:6)=dataStream(5:6,5:6);
%imshow(toFind);
tic;
foundAt=simpleSearch(fromSet,toFind);
linearSearchTime=toc;
if foundAt~=-1
foundAt=dec2bin(foundAt-1,8);
end
end