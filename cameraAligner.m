function aligner=cameraAligner()
cam=webcam('Logitech');
cam.Brightness=100;
%cam.Resolution = '640x360';
cam.Resolution = '160x120';
%cam.AvailableResolutions
cam.Contrast = 100;
%cam.Sharpness=100;
cam.Exposure=-6;
%x=zeros(1,10);
for i=1:100
    img = snapshot(cam);
    img=imcrop(img,[58 20 78 80]);
    imshow(img);
    img=rgb2gray(img);
    img=imresize(img,[8 8]);
    img=imbinarize(img);
    
    %x(i)=sum(sum(sum(img)));
    pause(1);
end
delete (cam);
%x=mean(x)
%show(x);
clear cam;
end