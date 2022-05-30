function setCamParameters=setCamParameter()
cam=webcam('Logitech');
cam.Brightness=50;
cam.Resolution = '160x120';
cam.Contrast = 150;
%cam.Sharpness=100;
cam.Exposure=-6;
setCamParameters=cam;
end