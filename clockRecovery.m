function recoveredClock = clockRecovery()
fromSet2=generateMatrices(4);
cam=webcam('Logitech');
cam.Brightness=50;
cam.Resolution = '160x120';
cam.Contrast = 100;
cam.Sharpness=100;
cam.Exposure=-7;
timeDif=[];
v=0.2;
c=0;
start=0;
stop=0;
f=false;
    for i=1:200
            img = snapshot(cam);
            img=imcrop(img,[55 20 85 80]);
            img=rgb2gray(img);
            img=imresize(img,[8 8]);
            img=imbinarize(img);
            imshow(img);
            [~,foundAt]=parallelSearchMatrix1(fromSet2,img);
            if(isequal(foundAt,'11111111') & ~f)
                if c==1
                    stop=toc;
                    timeDif=[timeDif round(stop*10000000)];
                    c=0;
                end
                disp("Start "+i);
                start=i;
                if start>=5
                    f=true;
                end
            elseif(isequal(foundAt,'00000000') & f)
                disp("Start");
                tic;
                c=1;
                f=false;    
            end
            pause(v);
    end
%[~,y]=size(timeDif);
recoveredClock=timeDif;
%recoveredClock=(mode(timeDif)/10)/2;
disp(recoveredClock);    
delete (cam);
clear cam;
end

