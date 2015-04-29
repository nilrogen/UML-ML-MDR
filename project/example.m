% load function files from subfolders
addpath (genpath ('.'));
% read images
[X,y,w,h] = readimages('Dataset/');
% n-number of samples
% d-dimensionality
[n,d] = size(X);
% perform full pca
[W,mu] = pca(X,y,n);
% plot
figure; hold on;
title('Eigenfaces');
for i=1:min(16,n)
    subplot(4,4,i);
    eigenface_i = toGrayscale(W(:,i), w, h);
    imshow(eigenface_i);
    colormap(jet(256));
    title(sprintf('Eigenface #%i', i));
end
saveas(cfg, "img.png");

steps = 10:20:min(n,320);
Q = X(1,:); % first image to reconstruct
figure; hold on;
title('Reconstruction');
for i=1:min(16, length(steps))
    subplot(4,4,i);
    numEvs = steps(i);
    P = project(W(:,1:numEvs), X(1,:), mu);
    R = reconstruct(W(:,1:numEvs),P,mu);
    comp = toGrayscale(R, w, h);
    imshow(comp);
    title(sprintf('%i Eigenvectors', numEvs));
end
pause;
