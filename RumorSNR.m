% Creo l’immagine sintetica 50x50
img = zeros(50);
img(10:40, 10:20)=1;
img(20:30, 15:40)=0.5;

% Creo le immagini che riproducono solo il rumore
noise = zeros(50);
noiseLow =  imnoise(noise, 'gaussian', 0, 0.01);
noiseHigh = imnoise(noise, 'gaussian', 0, 0.1);

% Applico all'immagine sintetica il rumore casuale additivo nella forma ‘gaussiana’ con media
% nulla e varianza 0.01 (basso rumore) e 0.1 (alto rumore) attraverso la procedura imnoise di MATLAB.
imgRumorLow = imnoise(img, 'gaussian', 0, 0.01);
imgRumorHigh = imnoise(img, 'gaussian', 0, 0.1);

% Considero le sottomatrici delle immagini
sub_noiseLow = noiseLow(1:5, 1:5);
sub_noiseHigh = noiseHigh(1:5, 1:5);
sub_imgRumorLow = imgRumorLow(18:22, 18:22);
sub_imgRumorHigh = imgRumorHigh(18:22, 18:22);

% Calcolo SNR(1)
EstimStDev_Nlow = std2(sub_noiseLow);
EstimAverGray_SNlow = mean2(sub_imgRumorLow);
SNR1_low = EstimAverGray_SNlow / EstimStDev_Nlow;

EstimStDev_Nhigh = std2(sub_noiseHigh);
EstimAverGray_SNhigh = mean2(sub_imgRumorHigh);
SNR1_high = EstimAverGray_SNhigh / EstimStDev_Nhigh;

% Calcolo SNR(2)
EstimStDev_SNlow = std2(sub_imgRumorLow);
SNR2_low = EstimAverGray_SNlow / EstimStDev_SNlow;

EstimStDev_SNhigh = std2(sub_imgRumorHigh);
SNR2_high = EstimAverGray_SNhigh / EstimStDev_SNhigh;

% display dati
fprintf('\n----------------------\n');
fprintf('|   Immagine barra   |');
fprintf('\n----------------------\n');
fprintf('--- Gaussian noise ---\n');
fprintf('SNR(1) , low : %f\n', SNR1_low);
fprintf('SNR(1) , high : %f\n', SNR1_high);
fprintf('SNR(2) , low : %f\n', SNR2_low);
fprintf('SNR(2) , high : %f\n', SNR2_high);

figure('Name','Gaussian','NumberTitle','off')

subplot(1, 3, 1);
imshow(img), title('Original image');

subplot(1, 3, 2);
imshow(imgRumorLow), title('Image with lowrumor');

subplot(1, 3, 3);
imshow(imgRumorHigh), title('Image with high rumor');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Creo le immagini che riproducono solo il rumore
noiseLow =  imnoise(noise, 'salt & pepper', 0.1);
noiseHigh = imnoise(noise, 'salt & pepper', 0.5);

% Applico all'immagine sintetica il rumore casuale additivo nella forma ‘salt&pepper’ con
% parametri 0.1 (basso rumore) e 0.5 (alto rumore) attraverso la procedura imnoise di MATLAB.
imgRumorLow = imnoise(img, 'salt & pepper', 0.1);
imgRumorHigh = imnoise(img, 'salt & pepper', 0.5);

% Considero le sottomatrici delle immagini
sub_noiseLow = noiseLow(1:5, 1:5);
sub_noiseHigh = noiseHigh(1:5, 1:5);
sub_imgRumorLow = imgRumorLow(18:22, 18:22);
sub_imgRumorHigh = imgRumorHigh(18:22, 18:22);

% Calcolo SNR(1)
EstimStDev_Nlow = std2(sub_noiseLow);
EstimAverGray_SNlow = mean2(sub_imgRumorLow);
SNR1_low = EstimAverGray_SNlow / EstimStDev_Nlow;

EstimStDev_Nhigh = std2(sub_noiseHigh);
EstimAverGray_SNhigh = mean2(sub_imgRumorHigh);
SNR1_high = EstimAverGray_SNhigh / EstimStDev_Nhigh;

% Calcolo SNR(2)
EstimStDev_SNlow = std2(sub_imgRumorLow);
SNR2_low = EstimAverGray_SNlow / EstimStDev_SNlow;

EstimStDev_SNhigh = std2(sub_imgRumorHigh);
SNR2_high = EstimAverGray_SNhigh / EstimStDev_SNhigh;

% display dati
fprintf('--- Salt & Pepper noise ---\n');
fprintf('SNR(1) , low : %f\n', SNR1_low);
fprintf('SNR(1) , high : %f\n', SNR1_high);
fprintf('SNR(2) , low : %f\n', SNR2_low);
fprintf('SNR(2) , high : %f\n', SNR2_high);

figure('Name','Salt &Pepper','NumberTitle','off')
subplot(1, 3, 1);
imshow(img,'InitialMagnification','fit'), title('Original image');
subplot(1, 3, 2);
imshow(imgRumorLow,'InitialMagnification','fit'), title('Image with lowrumor');
subplot(1, 3, 3);
imshow(imgRumorHigh,'InitialMagnification','fit'), title('Image with high rumor');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

img = imread('tire.tif');

% Creo le immagini che riproducono solo il rumore
noiseLow =  imnoise(noise, 'gaussian', 0, 0.01);
noiseHigh = imnoise(noise, 'gaussian', 0, 0.1);

% Considero le sottomatrici delle immagini
sub_noiseLow = noiseLow(1:5, 1:5);
sub_noiseHigh = noiseHigh(1:5, 1:5);
sub_img = img(15:20, 15:20);

% Calcolo stime
EstimStDev_Nlow = std2(sub_noiseLow);
EstimStDev_Nhigh = std2(sub_noiseHigh);
EstimStDev_SN = std2(sub_img);
EstimAverGray_SN = mean2(sub_img);

% Calcolo SNR(1)
SNR1_low = EstimAverGray_SN / EstimStDev_Nlow;
SNR1_high = EstimAverGray_SN / EstimStDev_Nhigh;

% Calcolo SNR(2)
SNR2 = EstimAverGray_SN / EstimStDev_SN;

% display dati
fprintf('\n----------------------\n');
fprintf('|   Image tire.tif   |');
fprintf('\n----------------------\n');
fprintf('--- Gaussian ---\n');
fprintf('SNR(1) , low : %f\n', SNR1_low);
fprintf('SNR(1) , high : %f\n', SNR1_high);
fprintf('SNR(2) : %f\n', SNR2);

figure('Name','Image tire.tif, Gaussian','NumberTitle','off')
subplot(1, 3, 1);
imshow(img), title('Original image');
subplot(1, 3, 2);
imshow(noiseLow), title('Image with low rumor');
subplot(1, 3, 3);
imshow(noiseHigh), title('Image with high rumor');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Creo le immagini che riproducono solo il rumore
noiseLow =  imnoise(noise, 'salt & pepper', 0.1);
noiseHigh = imnoise(noise, 'salt & pepper', 0.5);

% Considero le sottomatrici delle immagini
sub_noiseLow = noiseLow(1:5, 1:5);
sub_noiseHigh = noiseHigh(1:5, 1:5);

% Calcolo stime
EstimStDev_Nlow = std2(sub_noiseLow);
EstimStDev_Nhigh = std2(sub_noiseHigh);

% Calcolo SNR(1)
SNR1_low = EstimAverGray_SN / EstimStDev_Nlow;
SNR1_high = EstimAverGray_SN / EstimStDev_Nhigh;

% Calcolo SNR(2)
SNR2 = EstimAverGray_SN / EstimStDev_SN;

% display dati
fprintf('--- Salt & Pepper ---\n');
fprintf('SNR(1) , low : %f\n', SNR1_low);
fprintf('SNR(1) , high : %f\n', SNR1_high);
fprintf('SNR(2) : %f\n', SNR2);

figure('Name','Image tire.tif, Salt & Pepper','NumberTitle','off')
subplot(1, 3, 1);
imshow(img), title('Original image');
subplot(1, 3, 2);
imshow(noiseLow), title('Image with low rumor');
subplot(1, 3, 3);
imshow(noiseHigh), title('Image with high rumor');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Creo l’immagine sintetica 50x50
img = zeros(50);
img(10:40, 10:20)=1;
img(20:30, 15:40)=0.5;

% Applico all'immagine sintetica il rumore casuale additivo nella forma ‘gaussiana’ con media
% nulla e varianza 0.01 (basso rumore) e 0.1 (alto rumore) attraverso la procedura imnoise di MATLAB.
imgRumorLow = imnoise(img, 'gaussian', 0, 0.01);
imgRumorHigh = imnoise(img, 'gaussian', 0, 0.1);

fprintf('\n----------------------\n');
fprintf('|   Immagine barra   |');
fprintf('\n----------------------\n');

EstimAverGray_SN = std2(img);
EstimStDev_SN = mean2(img);
SNR2 = EstimAverGray_SN / EstimStDev_SN;

fprintf('SNR(2) img : %f\n', SNR2);

SNR2low_tot = 0;
SNR2high_tot = 0;
k=0;

fprintf('--- SNR(2) 10 finestre ---\n');
for i = 1 : 5 : 46
    k=k+1;
    sub_imgRumorLow = imgRumorLow(i:i+4, i:i+4);
    sub_imgRumorHigh = imgRumorHigh(i:i+4, i:i+4);
    
    EstimStDev_SNlow = std2(sub_imgRumorLow);
    EstimStDev_SNhigh = std2(sub_imgRumorHigh);
    
    EstimAverGray_SNlow = mean2(sub_imgRumorLow);
    EstimAverGray_SNhigh = mean2(sub_imgRumorHigh);
    
    SNR2_low = EstimAverGray_SNlow / EstimStDev_SNlow;
    SNR2_high = EstimAverGray_SNhigh / EstimStDev_SNhigh;
    
    SNR2low_tot = SNR2low_tot + SNR2_low;
    SNR2high_tot = SNR2high_tot + SNR2_high;
    
    fprintf('SNR(2) finestra %i : \t',k);
    fprintf('L : %f\t H : %f\n', SNR2_low, SNR2_high);
    
end

fprintf('--- media delle 10 finestre ---\n');
fprintf('SNR(2) media low : %f\n', SNR2low_tot/10);
fprintf('SNR(2) media high : %f\n', SNR2high_tot/10);







