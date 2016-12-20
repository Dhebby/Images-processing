img = imread('cameraman.tif');
img_mask = imread('moon.tif');

figure('Name','Negative','NumberTitle','off')

img_neg = 255-img;

subplot(2, 2, 1);
imshow(img), title('Original Image');
subplot(2, 2, 2);
imhist(img), grid on;

subplot(2, 2, 3);
imshow(img_neg), title('Negative Image');
subplot(2, 2, 4);
imhist(img_neg), grid on;

figure('Name','Concatenation','NumberTitle','off')

img_mask = imresize(img_mask, size(img));

img_final = img;

for alpha = 0.2:0.2:1
    img_comb = (1-alpha)*img+alpha*img_mask;
    img_final = cat(2, img_final, img_comb);
end

subplot(2, 1, 1)
imshow(img_final), title('Images concatenated');
subplot(2, 1, 2)
imshow(255-img_final), title('Images concatenated');


