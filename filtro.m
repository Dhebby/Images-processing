function img_out = filtro(varLow, varHigh)

    img = checkerboard;
    imgRumor = imnoise(img, 'gaussian', 0, varLow);
    
    %filtraggio rumore media semplice 3x3
    H = fspecial('average', 3);
    B = imfilter (imgRumor, H);
    
    figure('Name',sprintf('Variance %s average filter', num2str(varLow)),'NumberTitle','off')
    
    subplot(1, 4, 1);
    imshow(img), title('Original image');
    subplot(1, 4, 2);
    imshow(imgRumor), title('img + noise');
    subplot(1, 4, 3);
    imshow(B), title('mask 3x3');
    
    %filtraggio rumore media semplice 5x5
    H = fspecial('average', 5);
    B = imfilter (imgRumor, H);
    
    subplot(1, 4, 4);
    imshow(B), title('mask 5x5');
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    imgRumor = imnoise(img, 'gaussian', 0, varHigh);
    
    %filtraggio rumore media semplice 3x3
    H = fspecial('average', 3);
    B = imfilter (imgRumor, H);
    
    figure('Name',sprintf('Variance %s average filter', num2str(varHigh)),'NumberTitle','off')
    
    subplot(1, 4, 1);
    imshow(img), title('Original image');
    subplot(1, 4, 2);
    imshow(imgRumor), title('img + noise');
    subplot(1, 4, 3);
    imshow(B), title('mask 3x3');
    
    %filtraggio rumore media semplice 5x5
    H = fspecial('average', 5);
    B = imfilter (imgRumor, H);
    
    subplot(1, 4, 4);
    imshow(B), title('mask 5x5');
end