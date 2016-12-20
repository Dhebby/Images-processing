ImgRainbow = reshape(ones(64,1)*reshape(jet(64),1,192), [64,64,3]);

figure('Name','Jet RGB','NumberTitle','off')

subplot (2, 2, 1);
imshow(ImgRainbow), title('Rainbow');

subplot (2, 2, 2);
imshow(ImgRainbow(:, :, 1)), title('Red channel');

subplot (2, 2, 3);
imshow(ImgRainbow(:, :, 2)), title('Green channel');

subplot (2, 2, 4);
imshow(ImgRainbow(:, :, 3)), title('Blue channel');

figure('Name','Jet HSV','NumberTitle','off')

RainbowHSV = rgb2hsv(ImgRainbow);

subplot (2, 2, 1);
imshow(ImgRainbow), title('Rainbow');

subplot (2, 2, 2);
imshow(RainbowHSV(:, :, 1)), title('Hue channel');

subplot (2, 2, 3);
imshow(RainbowHSV(:, :, 2)), title('Saturation channel');

subplot (2, 2, 4);
imshow(RainbowHSV(:, :, 3)), title('Value channel');

figure('Name','Jet Hue channel HSV','NumberTitle','off')

imshow(RainbowHSV(:, :, 1), 'InitialMagnification', 'fit'), title('Hue channel HSV');
colormap hsv, colorbar

for c = 1:6
    switch c
        case 1
            mappa_colore = reshape(hot(64),1,192);
            mappa = 'Hot';
        case 2
            mappa_colore = reshape(parula(64),1,192);
            mappa = 'Parula';
        case 3
            mappa_colore = reshape(winter(64),1,192);
            mappa = 'Winter';
        case 4
            mappa_colore = reshape(spring(64),1,192);
            mappa = 'Spring';
        case 5
            mappa_colore = reshape(summer(64),1,192);
            mappa = 'Summer';
        case 6
            mappa_colore = reshape(autumn(64),1,192);
            mappa = 'Autumn';
    end
    ImgRainbow = reshape(ones(64,1)*mappa_colore, [64,64,3]);
    figure('Name',sprintf(mappa),'NumberTitle','off')
    RainbowHSV = rgb2hsv(ImgRainbow);

    subplot (2, 2, 1);
    imshow(ImgRainbow), title('Rainbow');

    subplot (2, 2, 2);
    imshow(RainbowHSV(:,:,1)), title('Hue channel');

    subplot (2, 2, 3);
    imshow(RainbowHSV(:,:,2)), title('Saturation channel');

    subplot (2, 2, 4);
    imshow(RainbowHSV(:,:,3)), title('Value channel');
end
