function main=main(sq)
txRate=[2000, 1500, 1000, 500];
sBERs=[];
%frameRate=2;
allChar=[];
s='';
txString='ABCDEFGH';
%comDataStream=dec2bin(2^sq-1:-1:0)-'0';
message='<A><B><C><D><E><F><G><H>';
comDataStream=dec2bin(message,8);
lSearchAvg=[];
hSearch1Avg=[];
hSearch2Avg=[];
speedUpH1=[];
speedUpH2=[];
lSearch1=[];
flag=1;
charArray=[];
for c=1:2
for b=1:4
    frameRate=round(1000*3/txRate(b));
for a=1:100
    for x=1:strlength(message)
        lSearch=[];
        hSearch1=[];
        hSearch2=[];

        dataStream=comDataStream(x,:);
        %disp(dataStream);
        %for y=1:20
        for z=1:frameRate
            selected=imageSelector(frameRate,txRate(b));
            if selected
                %disp("Error");
                foundAt=-1;
            else
                switch c
                    case 1
                    fromSet1=generateMatrices(sq);
                    [~,foundAt]=searchMatrix(fromSet1,dataStream);
                    case 2
                    fromSet2=generateMatrices(sq/2);
                    [~,foundAt]=parallelSearchMatrix1(fromSet2,dataStream);
                    case 3
                    fromSet3=generateMatrices(sq/4);
                    [~,foundAt]=parallelSearchMatrix2(fromSet3,dataStream); 
                end
                %disp("F:"+foundAt);
                %lSearch1=[lSearch1 lSearch];
            end
                if foundAt~=-1
                   charDec=bin2dec(foundAt);
                   allChar=[allChar charDec];
                   if(charDec==60)
                        charArray=[];
                        flag=1;
                   elseif(charDec==62 & flag==1)
                        m=mode(charArray);
                        s=strcat(s,char(m));
                        %disp(s);
                        flag=0;
                   elseif flag==1
                         charArray=[charArray charDec];
                   end
                end
            end
            
           
           % hSearch2=[hSearch2,parallelSearchMatrix2(fromSet3,dataStream)];
        %end
%         lSearchAvg=[lSearchAvg,sum(lSearch)/20];
%         hSearch1Avg=[hSearch1Avg,sum(hSearch1)/20];
%         hSearch2Avg=[hSearch2Avg,sum(hSearch2)/20];
%         speedUpH1=[speedUpH1,lSearchAvg/hSearch1Avg]; 
%         speedUpH2=[speedUpH2,lSearchAvg/hSearch2Avg];
    end
end
sBer=getBER(txString,s);
%sBer=(1/sBer)/10000;
sBERs=[sBERs sBer];
disp("BER:"+sBer);
end
end
sBERs=reshape(sBERs,2,4);
figure
plot(txRate,sBERs);
%     xAxis=[1:256];
%     figure(1); hold on
%     a1 = plot(xAxis,lSearchAvg); M1 = "Linear";
%     a2 = plot(xAxis,hSearch1Avg); M2 = "Heirarchical L1";
%     a3 = plot(xAxis,hSearch2Avg); M3 = "Heirarchical L2";
%     %legend([a1,a2], [M1, M2]);
%     xlabel('Decimal value of 8 bit data') 
%     ylabel('Avg. Time in Seconds') 
%     legend([a1,a2,a3], [M1, M2, M3]);
%     hold off
%     grid
%     
%     figure(2);hold on
%     b1 = plot(xAxis,speedUpH1); M1 = "Level 1 Speed Up";
%     b2 = plot(xAxis,speedUpH2); M2 = "Level 2 Speed Up";
%     xlabel('Decimal value of 8 bit data') 
%     ylabel('Speed Up') 
%     legend([b1,b2], [M1, M2]);
%     hold off
%     grid
end