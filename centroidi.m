% immagine
bar = zeros(50);
bar(5:45, 5:15)=1;
bar(35:45, 20:45)=1;
bar(5:30, 35:45)=1;
bar(5:15, 20:30)=1;

% componenti connesse
CC = bwconncomp(bar);

stats = regionprops('table',CC, 'Centroid', 'Perimeter')

figure
subplot(1, 2, 1)
imshow(bar);

subplot(1, 2, 2)
centroids = cat(1, stats.Centroid);
imshow(bar);
hold on
plot(centroids(:,1),centroids(:,2), 'r*')
hold off
