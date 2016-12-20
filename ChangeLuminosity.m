function img_out = ChangeLuminosity()
    img = imread('pout.tif');
    
    figure('Name','Original Image','NumberTitle','off')
    
    subplot(1, 2, 1);
    imshow(img);
    subplot(1, 2, 2);
    imhist(img), grid on;
    
    
    for i = 1:3
        L =  i *30;
        img = img + L;
        
        figure('Name',sprintf('Luminosity + %i',L),'NumberTitle','off')
        subplot(1, 2, 1);
        imshow(img);
        subplot(1, 2, 2);
        imhist(img), grid on;
    end
end