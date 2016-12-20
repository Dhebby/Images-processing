imgcolor = imread('peppers.png');

subplot (2, 2, 1);
imshow(imgcolor), title('Original image');

subplot (2, 2, 2);
imgred = imgcolor;
imgred(:, :, 2) = 0;
imgred(:, :, 3) = 0;
imshow(imgred), title('Red channel');

subplot (2, 2, 3);
imggreen = imgcolor;
imggreen(:, :, 1) = 0;
imggreen(:, :, 3) = 0;
imshow(imggreen), title('Green channel');

subplot (2, 2, 4);
imgblue = imgcolor;
imgblue(:, :, 1) = 0;
imgblue(:, :, 2) = 0;
imshow(imgblue), title('Blue channel');

figure

subplot (4, 2, 1);
imshow(imgcolor), title('Original image');

subplot (4, 2, 2);
imhist(rgb2gray(imgcolor)), grid on, title('Original image histogram');

subplot (4, 2, 3);
imshow(imgred), title('Red channel');

subplot (4, 2, 4);
imhist(imgcolor(:, :, 1)), grid on, title('Red channel histogram');

subplot (4, 2, 5);
imshow(imggreen), title('Green channel');

subplot (4, 2, 6);
imhist(imgcolor(:, :, 2)), grid on, title('Green channel histogram');

subplot (4, 2, 7);
imshow(imgblue), title('Blue channel');

subplot (4, 2, 8);
imhist(imgcolor(:, :, 3)), grid on,  title('Blue channel histogram');

figure

imgsize = size(imgcolor);
x = [1 imgsize(1)];
y = [1 imgsize(2)];

subplot (4, 2, 1);
imshow(imgcolor), title('Origina image');

subplot (4, 2, 2);
improfile(imgcolor, x, y), grid on, title('Original image scanline');

subplot (4, 2, 3);
imshow(imgred), title('Red channel');

subplot (4, 2, 4);
improfile(imgred, x, y), grid on, title('Red channel scanline');

subplot (4, 2, 5);
imshow(imggreen), title('Green channel');

subplot (4, 2, 6);
improfile(imggreen, x, y), grid on, title('Green channel scanline');

subplot (4, 2, 7);
imshow(imgblue), title('Blue channel');

subplot (4, 2, 8);
improfile(imgblue, x, y), grid on,  title('Blue channel scanline');














