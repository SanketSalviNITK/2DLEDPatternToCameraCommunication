Pprs3 = imread("Pat120cm.jpg");                  % Colour Image
Pprs1 = rgb2gray(Pprs3);                        % Grayscale Image
x = 0:size(Pprs1,2)-1;
y = 0:size(Pprs1,1)-1;
[X,Y] = meshgrid(x,y);                          % Coordinate Matrices (Not Necessary)
figure(1)
meshc(X, Y, Pprs1)                              % Mesh Plot
grid on
xlabel('X')
ylabel('Y')
zlabel('Intensity')
colormap(jet)                                   % Set ‘colormap’