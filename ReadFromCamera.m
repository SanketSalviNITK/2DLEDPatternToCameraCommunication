function camRead=ReadFromCamera(j)%j is for selection of algorithm
fromSet1=generateMatrices(8);
fromSet2=generateMatrices(4);
fromSet3=generateMatrices(2);
cam=webcam('Logitech');
cam.Brightness=50;
cam.Resolution = '160x120';
cam.Contrast = 100;
%cam.Sharpness=100;
cam.Exposure=-7;
%cam.Focus=10;
lTime=[];
h1Time=[];
h2Time=[];
recoveredClock=0.2;
flag=1;
count=0;
charArray=[];
%for j=1:3
    for i=1:200
        %disp("i:"+i);
        img = snapshot(cam);
        img=imcrop(img,[50 20 85 70]);
        %imshow(img);
        img=rgb2gray(img);
        img=imbinarize(img);
        img=imresize(img,[8 8]);
        imshow(img);
            switch j
            case 1    
                [ltime,foundAt]=searchMatrix(fromSet1,img);
                lTime=[lTime ltime];
            case 2
                [h1time,foundAt]=parallelSearchMatrix1(fromSet2,img);
                h1Time=[h1Time h1time];
            case 3
                [h2time,foundAt]=parallelSearchMatrix2(fromSet3,img);
                h2Time=[h2Time h2time];
            end
%             if (isequal(foundAt,'11111111') & flag==1)
%                 count=count+1;
%                 disp("Counter:"+count);
%                 if count==5
%                     recoveredClock=clockRecovery(fromSet2,cam);
%                     disp("Recovered Clock:"+recoveredClock);
%                     count=0;
%                     flag=0;
%                 end
%             elseif flag==0
%                     count=0;
%                     flag=1;
%             end
%                 
                
        %end
        if foundAt~=-1
            charDec=bin2dec(foundAt);
            %disp(char(charDec));
            if(charDec==60)
                charArray=[];
                flag=1;
            elseif(charDec==62 & flag==1)
                disp(char(mode(charArray)));
                flag=0;
            elseif flag==1
                charArray=[charArray charDec];
            end
        end
%         %imshow(imresize(img,[64 64]));
        %pause(1);
        pause(recoveredClock);
end
delete (cam);
clear cam;
xAxis=[1:200];
figure; hold on
a1 = plot(xAxis,lTime); M1 = "Linear";
a2 = plot(xAxis,h1Time); M2 = "Heirarchical L1";
a3 = plot(xAxis,h2Time); M3 = "Heirarchical L2";
%legend([a1,a2], [M1, M2]);
xlabel('Decimal value of 8 bit data') 
ylabel('Avg. Time in Seconds') 
legend([a1,a2,a3], [M1, M2, M3]);
hold off
end