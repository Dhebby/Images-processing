function img_out = ChangeContrast()
    img = imread('pout.tif');
    
    figure('Name','Original Image','NumberTitle','off')
    
    subplot(1, 2, 1);
    imshow(img);
    subplot(1, 2, 2);
    imhist(img), grid on;
    
    
    for i = 0.5:0.5:2
        if (i ~= 1.0) 
            P = i;
            img = img * P;
            
            figure('Name',sprintf('Contrast * %i',P),'NumberTitle','off')
            subplot(1, 2, 1);
            imshow(img);
            subplot(1, 2, 2);
            imhist(img), grid on;
        end
    end
end