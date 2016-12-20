% immagini
bar = zeros(50);
bar(10:40, 10:30)=1;
bar(20:35, 20:45)=0.5;

img1 = imread('coins.png');
img2 = imread('mri.tif');

%%%%%%%%%%%%%%%%%%% (a) %%%%%%%%%%%%%%%%%%
%Sobel
sobelX = fspecial('sobel');
sobelY = sobelX';

ImmDerivX = imfilter(bar, sobelX);
ImmDerivY = imfilter(bar, sobelY);
barAmpS = abs(ImmDerivX)+abs(ImmDerivY);

edgeS = edge(bar, 'Sobel');

figure('Name','SOBEL confronts','NumberTitle','off')
imshowpair(barAmpS, edgeS, 'montage'), title('sobel + edge');



%%%%%%%%%%%%%%%%%%% (b) %%%%%%%%%%%%%%%%%%
edge1 = edge(img1);
edge2 = edge(img2);

figure('Name','EDGE confronts','NumberTitle','off')
subplot(2, 1, 1)
imshowpair(img1, edge1, 'montage'), title('img + edge');
subplot(2, 1, 2)
imshowpair(img2, edge2, 'montage'), title('img + edge');

%%%%%%%%%%%%%%%%%%% (c) %%%%%%%%%%%%%%%%%%
log1 = edge(img2, 'log', 0, 0.5);
log2 = edge(img2, 'log', 0, 2);
log3 = edge(img2, 'log', 0, 3);

figure('Name','LOG confronts','NumberTitle','off')
subplot(1, 3, 1)
imshow(log1), title('sigma = 0.5');
subplot(1, 3, 2)
imshow(log2), title('sigma = 2');
subplot(1, 3, 3)
imshow(log3), title('sigma = 3');



