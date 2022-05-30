function img=readImage(img)
img=rgb2gray(img);
img=imresize(img,[32 32]);
img=imresize(img,[8 8]);
img=imbinarize(img);
imshow(img)
fromSet=generateMatrices(8);
foundAt=simpleSearch(fromSet,img);
disp(dec2bin(foundAt-1,8));
end