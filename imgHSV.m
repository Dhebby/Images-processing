imgcolor = imread('peppers.png');

imHSV = rgb2hsv(imgcolor);

figure('Name','Image HSV','NumberTitle','off')

subplot (3, 3, 4);
imshow(imgcolor), title('Original Image');

subplot (3, 3, 2);
imshow(imHSV(:, :, 1)), title('Hue');

subplot (3, 3, 3);
imhist(imHSV(:, :, 1)), grid on, title('Hue histogram');

subplot (3, 3, 5);
imshow(imHSV(:, :, 2)), title('Saturation');

subplot (3, 3, 6);
imhist(imHSV(:, :, 2)), grid on, title('Saturation histogram');

subplot (3, 3, 8);
imshow(imHSV(:, :, 3)), title('Value');

subplot (3, 3, 9);
imhist(imHSV(:, :, 3)), grid on, title('Value histogram');

figure('Name','Image HSV Desaturated','NumberTitle','off')

imHSVd = imHSV;
imHSVd(:, :, 2) = 0;
%azzerando la saturazioe gli altri due valori non variano
%inoltre faccio la scala di grigi dell'img

subplot (3, 3, 4);
imshow(imHSV), title('Image HSV');

subplot (3, 3, 2);
imshow(imHSVd(:,:,1)), title('Hue');

subplot (3, 3, 3);
imhist(imHSVd(:,:,1)), grid on, title('Hue histogram');

subplot (3, 3, 5);
imshow(imHSVd(:,:,2)), title('Saturation');

subplot (3, 3, 6);
imhist(imHSVd(:,:,2)), grid on, title('Saturation histogram');

subplot (3, 3, 8);
imshow(imHSVd(:,:,3)), title('Value');

subplot (3, 3, 9);
imhist(imHSVd(:,:,3)), grid on, title('Value histogram');

figure('Name','Value Histograms Confront','NumberTitle','off')

subplot (2, 2, 1);
imshow(imHSV(:,:,3)), title('Value');

subplot (2, 2, 2);
imhist(imHSV(:,:,3)), grid on, title('Value histogram');

subplot (2, 2, 3);
imshow(imHSVd(:,:,3)), title('Desaturated Value');

subplot (2, 2, 4);
imhist(imHSVd(:,:,3)), grid on, title('Desaturated Value Histogram');

