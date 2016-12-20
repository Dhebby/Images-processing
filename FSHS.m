function img_out = FSHS()
    img = imread('pout.tif');
    
    figure('Name','Original Image','NumberTitle','off')
    
    subplot(1, 2, 1);
    imshow(img);
    subplot(1, 2, 2);
    imhist(img), grid on;
    
    A = min(min(img));
    B = max(max(img));
    K = 255;
    
    img = (K-1)/(B-A) * (img-A);
            
    figure('Name','Full-Scale Histogram Stretch','NumberTitle','off')
    
    subplot(1, 2, 1);
    imshow(img);
    subplot(1, 2, 2);
    imhist(img), grid on;
end