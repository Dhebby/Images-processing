img = imread('circlesBrightDark.png');
imgRumor = imnoise(img, 'gaussian', 0, 0.3);

% applico filtro gaussiano
G = fspecial('gaussian', 3);
FG = imfilter (imgRumor, G);
% applico filtro mediano
FM= medfilt2(imgRumor);

figure('Name','Gaussian noise','NumberTitle','off')

subplot(1, 4, 1);
imshow(img), title('Original image');
subplot(1, 4, 2);
imshow(imgRumor), title('img + noise');
subplot(1, 4, 3);
imshow(FG), title('Gaussian filter');
subplot(1, 4, 4);
imshow(FM), title('Median filter');

%calcolo la deviazione standard per vedere quale filtro è meglio
%è meglio il filtro con la std piu vicina a qualla dell'img originale
std2(img);
std2(FG);
std2(FM);


fprintf('\nSTD Original Img : %f\n', std2(img));
fprintf('\n--- Gaussian noise ---\n');
fprintf('STD Gaussian filter : %f\n', std2(FG));
fprintf('STD Median filter : %f\n', std2(FM));

if (std2(FG)-std2(img)) < (std2(FM)-std2(img))
    fprintf('Best filter : Gaussian\n');
else
    fprintf('Best filter : Median\n');
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

imgRumor = imnoise(img, 'salt & pepper', 0.3);

% applico filtro gaussiano
G = fspecial('gaussian', 3);
FG = imfilter (imgRumor, G);
% applico filtro mediano
FM = medfilt2(imgRumor);

figure('Name','Salt & Pepper noise','NumberTitle','off')

subplot(1, 4, 1);
imshow(img), title('Original image');
subplot(1, 4, 2);
imshow(imgRumor), title('img + noise');
subplot(1, 4, 3);
imshow(FG), title('Gaussian filter');
subplot(1, 4, 4);
imshow(FM), title('Median filter');

% display dati
fprintf('\n--- Salt & Pepper noise ---\n');
fprintf('STD Gaussian filter : %f\n', std2(FG));
fprintf('STD Median filter : %f\n', std2(FM));

if (std2(FG)-std2(img)) < (std2(FM)-std2(img))
    fprintf('Best filter : Gaussian\n');
else
    fprintf('Best filter : Median\n');
end


