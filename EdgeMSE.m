% immagine
bar = zeros(50);
bar(5:45, 5:15)=1;
bar(35:45, 20:45)=1;
bar(5:30, 35:45)=1;
bar(5:15, 20:30)=1;

%%%%%%%%%%%%%%%%%%% (a) %%%%%%%%%%%%%%%%%%%%%%
%Sobel
sobelX = fspecial('sobel');
sobelY = sobelX';

% calcolo ampiezza
ImmDerivX = imfilter(bar, sobelX);
ImmDerivY = imfilter(bar, sobelY);
barAmpS = abs(ImmDerivX)+abs(ImmDerivY);

% binarizzo l'immagine
barAmpS = im2bw(barAmpS, 0.1);

%%%%%%%%%%%%%%%%%%% (b) %%%%%%%%%%%%%%%%%%%%%%
% edge sobel e log
edgeS = edge(bar, 'Sobel');
edgeL = edge(bar, 'log');

figure
subplot(1, 4, 1)
imshow(bar), title('Immagine sintetica');
subplot(1, 4, 2)
imshow(barAmpS), title('Edge Sobel sintetica');
subplot(1, 4, 3)
imshow(edgeS), title('Edge Sobel manuale');
subplot(1, 4, 4)
imshow(edgeL), title('Edge LoG');

%%%%%%%%%%%%%%%%%%% (c) %%%%%%%%%%%%%%%%%%%%%%
% immagine perimetro
Pbar = bwperim(bar);

figure
subplot(1, 2, 1)
imshow(bar), title('Immagine sintetica');
subplot(1, 2, 2)
imshow(Pbar), title('Perimetro');

%%%%%%%%%%%%%%%%%%% (d) %%%%%%%%%%%%%%%%%%%%%%
%converto le immagine da logical a uint8 per avere matrici
Pbar = +Pbar;
barAmpS = +barAmpS;
edgeS = +edgeS;
edgeL = +edgeL;

% MSE sobel manuale
ERR_Sm = immse(Pbar, barAmpS);
% MSE sobel edge
ERR_Se = immse(Pbar, edgeS);
% MSE LoG
ERR_L = immse(Pbar, edgeL);

%%%%%%%%%%%%%%%%%%% (e) %%%%%%%%%%%%%%%%%%%%%%

T = table(ERR_Sm, ERR_Se, ERR_L,'RowNames',{'Mean_Square_Error'} , 'VariableNames', {'Perim_Sobel_manuale', 'Perim_Sobel_edge', 'Perim_LoG'})
