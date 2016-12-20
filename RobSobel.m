% immagini
bar = zeros(50);
bar(10:40, 10:30)=1;
bar(20:35, 20:45)=0.5;

barNoise = imnoise(bar, 'gaussian', 0, 0.01);

img = imread('blobs.png');
img = +img;

imgNoise = imnoise(img, 'gaussian', 0, 0.01);

img2 = imread('circuit.tif');

%%%%%%%%%%%%%%%%%%% (a) %%%%%%%%%%%%%%%%%%
% Roberts
robertsX = [-1, 0; 0, 1];
robertsY = [0, -1; 1, 0];

ImmDerivX = imfilter(bar, robertsX);
ImmDerivY = imfilter(bar, robertsY);
barAmpR = abs(ImmDerivX)+abs(ImmDerivY);

figure('Name','ROBERTS','NumberTitle','off')
subplot(2, 3, 1)
imshow(bar), title('Original image');
subplot(2, 3, 2)
imshow(ImmDerivX), title('Roberts x');
subplot(2, 3, 3)
imshow(ImmDerivY), title('Roberts y');
subplot(2, 3, 5)
imshow(barAmpR), title('Ampiezze');
subplot(2, 3, 6)
quiver(ImmDerivX, ImmDerivY), grid on, title('Direzioni');

%Sobel
sobelX = fspecial('sobel');
sobelY = sobelX';

ImmDerivX = imfilter(bar, sobelX);
ImmDerivY = imfilter(bar, sobelY);
barAmpS = abs(ImmDerivX)+abs(ImmDerivY);

figure('Name','SOBEL','NumberTitle','off')
subplot(2, 3, 1)
imshow(bar), title('Original image');
subplot(2, 3, 2)
imshow(ImmDerivX), title('Sobel x');
subplot(2, 3, 3)
imshow(ImmDerivY), title('Sobel y');
subplot(2, 3, 5)
imshow(barAmpS), title('Ampiezze');
subplot(2, 3, 6)
quiver(ImmDerivX, ImmDerivY), grid on, title('Direzioni');

%%%%%%%%%%%%%%%%%%% (b) %%%%%%%%%%%%%%%%%%
% Roberts
ImmDerivX = imfilter(barNoise, robertsX);
ImmDerivY = imfilter(barNoise, robertsY);
barNoiseAmpR = abs(ImmDerivX)+abs(ImmDerivY);

figure('Name','ROBERTS','NumberTitle','off')
subplot(2, 3, 1)
imshow(barNoise), title('Original image');
subplot(2, 3, 2)
imshow(ImmDerivX), title('Roberts x');
subplot(2, 3, 3)
imshow(ImmDerivY), title('Roberts y');
subplot(2, 3, 5)
imshow(barNoiseAmpR), title('Ampiezze');
subplot(2, 3, 6)
quiver(ImmDerivX, ImmDerivY), grid on, title('Direzioni');

%Sobel
ImmDerivX = imfilter(barNoise, sobelX);
ImmDerivY = imfilter(barNoise, sobelY);
barNoiseAmpS = abs(ImmDerivX)+abs(ImmDerivY);

figure('Name','SOBEL','NumberTitle','off')
subplot(2, 3, 1)
imshow(barNoise), title('Original image');
subplot(2, 3, 2)
imshow(ImmDerivX), title('Sobel x');
subplot(2, 3, 3)
imshow(ImmDerivY), title('Sobel y');
subplot(2, 3, 5)
imshow(barNoiseAmpS), title('Ampiezze');
subplot(2, 3, 6)
quiver(ImmDerivX, ImmDerivY), grid on, title('Direzioni');

%%%%%%%%%%%%%%%%%%% (c) %%%%%%%%%%%%%%%%%%
% senza rumore
% Roberts
ImmDerivX = imfilter(img, robertsX);
ImmDerivY = imfilter(img, robertsY);
imgAmpR = abs(ImmDerivX)+abs(ImmDerivY);

%Sobel
ImmDerivX = imfilter(img, sobelX);
ImmDerivY = imfilter(img, sobelY);
imgAmpS = abs(ImmDerivX)+abs(ImmDerivY);

figure('Name','Confornto ampiezze (senza rumore)','NumberTitle','off')
subplot(2, 2, 1)
imshow(barAmpR), title('Barra ampiezza Roberts');
subplot(2, 2, 2)
imshow(barAmpS), title('Barra ampiezza Sobel');
subplot(2, 2, 3)
imshow(imgAmpR), title('Image ampiezza Roberts');
subplot(2, 2, 4)
imshow(imgAmpS), title('Image ampiezza Sobel');

% con rumore
% Roberts
ImmDerivX = imfilter(imgNoise, robertsX);
ImmDerivY = imfilter(imgNoise, robertsY);
imgNoiseAmpR = abs(ImmDerivX)+abs(ImmDerivY);

%Sobel
ImmDerivX = imfilter(imgNoise, sobelX);
ImmDerivY = imfilter(imgNoise, sobelY);
imgNoiseAmpS = abs(ImmDerivX)+abs(ImmDerivY);

figure('Name','Confornto ampiezze (con rumore)','NumberTitle','off')
subplot(2, 2, 1)
imshow(barNoiseAmpR), title('BarraN ampiezza Roberts');
subplot(2, 2, 2)
imshow(barNoiseAmpS), title('BarraN ampiezza Sobel');
subplot(2, 2, 3)
imshow(imgNoiseAmpR), title('ImageN ampiezza Roberts');
subplot(2, 2, 4)
imshow(imgNoiseAmpS), title('ImageN ampiezza Sobel');

%%%%%%%%%%%%%%%%%%% (d) %%%%%%%%%%%%%%%%%%
%sobel
ImmDerivX = imfilter(img2, sobelX);
ImmDerivY = imfilter(img2, sobelY);
img2AmpS = abs(ImmDerivX)+abs(ImmDerivY);

figure('Name','SOBEL','NumberTitle','off')
subplot(2, 3, 1)
imshow(img2), title('Original image');
subplot(2, 3, 2)
imshow(ImmDerivX), title('Sobel x');
subplot(2, 3, 3)
imshow(ImmDerivY), title('Sobel y');
subplot(2, 3, 5)
imshow(img2AmpS), title('Ampiezze');
subplot(2, 3, 6)
quiver(ImmDerivX, ImmDerivY), grid on, title('Direzioni');

%%%%%%%%%%%%%%%%%%% (d) %%%%%%%%%%%%%%%%%%
%roberts
ImmDerivX = imfilter(img2, robertsX);
ImmDerivY = imfilter(img2, robertsY);
img2AmpR = abs(ImmDerivX)+abs(ImmDerivY);

binR = im2bw(img2AmpR, 0.1);
binS = im2bw(img2AmpS, 0.1);

figure('Name','binarizzazione','NumberTitle','off')
imshowpair(binR, binS, 'montage'), title('Roberts + Sobel');

%la roberts perde dettagli piccoli
%la sobel ha tuti i dettagli ma anke il rumore
