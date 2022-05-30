function [heirSearch2,foundAt]=parallelSearchMatrix2(fromSet,dataStream)
foundOU1at=-1;
foundOU2at=-1;
foundOL1at=-1;
foundOL2at=-1; 
foundIU1at=-1; 
foundIU2at=-1;
foundIL1at=-1;
foundIL2at=-1;


toFindOU1=zeros(2,2);
toFindOU2=zeros(2,2);
toFindOL1=zeros(2,2);
toFindOL2=zeros(2,2);
toFindIU1=zeros(2,2);
toFindIU2=zeros(2,2);
toFindIL1=zeros(2,2);
toFindIL2=zeros(2,2);

%For Simulation
% toFindOU1(1:2,1:2)=state(dataStream(1),1);
% toFindOU2(1:2,1:2)=state(dataStream(2),2);
% toFindOL1(1:2,1:2)=state(dataStream(3),3); 
% toFindOL2(1:2,1:2)=state(dataStream(4),4);
% toFindIU1(1:2,1:2)=state(dataStream(5),5);
% toFindIU2(1:2,1:2)=state(dataStream(6),6);
% toFindIL1(1:2,1:2)=state(dataStream(7),7);
% toFindIL2(1:2,1:2)=state(dataStream(8),8);


%For Realtime Testing
toFindOU1(1:2,1:2)=dataStream(1:2,1:2);
toFindOU2(1:2,1:2)=dataStream(1:2,7:8);
toFindOL1(1:2,1:2)=dataStream(7:8,1:2);
toFindOL2(1:2,1:2)=dataStream(7:8,7:8);
toFindIU1(1:2,1:2)=dataStream(3:4,3:4);
toFindIU2(1:2,1:2)=dataStream(3:4,5:6);
toFindIL1(1:2,1:2)=dataStream(5:6,3:4);
toFindIL2(1:2,1:2)=dataStream(5:6,5:6);


tic;
foundOU1at=simpleSearch(fromSet,toFindOU1);
foundOU2at=simpleSearch(fromSet,toFindOU2);
foundOL1at=simpleSearch(fromSet,toFindOL1);
foundOL2at=simpleSearch(fromSet,toFindOL2);
foundIU1at=simpleSearch(fromSet,toFindIU1);
foundIL1at=simpleSearch(fromSet,toFindIL1);
foundIU2at=simpleSearch(fromSet,toFindIU2);
foundIL2at=simpleSearch(fromSet,toFindIL2);
heirSearch2=toc;
% disp(foundOU1at);
% disp(foundOU2at);
% disp(foundOL1at);
% disp(foundOL2at);
% disp(foundIU1at);
% disp(foundIU2at);
% disp(foundIL1at);
% disp(foundIL2at);
if foundOU1at~=-1 && foundOU2at~=-1 && foundOL1at~=-1 && foundOL2at~=-1 && foundIU1at~=-1 && foundIU2at~=-1 && foundIL1at~=-1 && foundIL2at~=-1
    foundAt=[dec2bin(foundOU1at-1,2) dec2bin(foundOU2at-1,2) dec2bin(foundOL1at-1,2) dec2bin(foundOL2at-1,2) 
dec2bin(foundIU1at-1,2) dec2bin(foundIU2at-1,2) dec2bin(foundIL1at-1,2) dec2bin(foundIL2at-1,2)];
else
    foundAt=-1;
end