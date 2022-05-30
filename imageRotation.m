function imgRot=imageRotation()
oImg=zeros(8,8);
oImg=oImg+1;
oImg(1:2,1:2)=0;
imtool(oImg);
dImg=imrotate(oImg,60);
dImg=imresize(dImg,32);
imtool(dImg);
load westconcordpoints
tform = fitgeotrans(movingPoints, fixedPoints, 'projective');
Rfixed = imref2d(size(oImg));
registered1 = imwarp(dImg,tform,'FillValues', 255,'OutputView',Rfixed);
figure, imshowpair(oImg,registered1,'blend');
