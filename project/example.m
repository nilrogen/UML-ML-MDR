% load function files from subfolders
addpath (genpath ('.'));
% read images
[X,y,w,h] = readimages('Dataset');
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
hold off;

steps = 10:20:min(n,320);
figure; hold on;
title('Reconstruction');
imageToUse = 11;
for i=1:min(16, length(steps))
    numEvs = steps(i);
    P = project(W(:,1:numEvs), X(imageToUse,:), mu);
    R = reconstruct(W(:,1:numEvs),P,mu);
    comp = toGrayscale(R, w, h);
    imshow(comp);
    title(sprintf('%i Eigenvectors', numEvs));
end
hold off;

