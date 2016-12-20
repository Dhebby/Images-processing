imgcolor = imread('peppers.png');

subplot (2, 2, 1);
imshow(imgcolor), title('Original image');

subplot (2, 2, 2);
imgcyan = imgcolor;
imgcyan(:, :, 1) = 0;
imshow(imgcyan), title('Cyan channel');

subplot (2, 2, 3);
imgmagenta = imgcolor;
imgmagenta(:, :, 2) = 0;
imshow(imgmagenta), title('Magenta channel');

subplot (2, 2, 4);
imgyellow = imgcolor;
imgyellow(:, :, 3) = 0;
imshow(imgyellow), title('Yellow channel');

figure

subplot (4, 2, 1);
imshow(imgcolor), title('Original image');

subplot (4, 2, 2);
imhist(rgb2gray(imgcolor)), grid on, title('Original image histogram');

subplot (4, 2, 3);
imshow(imgcyan), title('Cyan channel');

subplot (4, 2, 4);
imhist(imgcolor(:, :, 2) + imgcolor(:, :, 3)), grid on, title('Cyan channel histogram');

subplot (4, 2, 5);
imshow(imgmagenta), title('Magenta channel');

subplot (4, 2, 6);
imhist(imgcolor(:, :, 1) + imgcolor(:, :, 3)), grid on, title('Magenta channel histogram');

subplot (4, 2, 7);
imshow(imgyellow), title('Yellow channel');

subplot (4, 2, 8);
imhist(imgcolor(:, :, 1) + imgcolor(:, :, 2)), grid on,  title('Yellow channel histogram');
