function [X y width height] = readimages(path_fn)
  % get files for given path
  folder = getimages(path_fn);
  % initialize
  X=[];
  y=[];
  width=0;
  height=0;
  % I used a very basic naming convention here because I forgot ours, change this code!!!
  % start counting
  classIdx = 1;
  % for each folder
  for i=1:length(folder)
    subject = folder{i};
    % get files in subdir
    images = getimages([path_fn, filesep, subject]);
    % ignore files/empty folders
    if(length(images) == 0)
      continue; 
    end
    % for each image
    for j=1:10%length(images)
      % get absolute path
      filename = [path_fn, filesep, subject, filesep, images{j}];

      % read image
      T = double(imread(filename));
      % get image info
      [height width channels] = size(T);
      % grayscale image
      if(channels == 3)
        T = 0.2989 * T(:,:,1) + 0.5870* T(:,:,2) + 0.1140 * T(:,:,3);
      end
	  %normalize images to 100x100
	  T = scale(T, [ (100.0/height) (100.0/width) ]);
      % reshape -> row vector -> append w/ data matrix
      X = [X; reshape(T,1,100*100)];
      % append corresponding class w/ class vector
      y = [y, classIdx];
    end
    % increment
    classIdx = classIdx + 1;
  end % for each folder.
end

% Code found at http://stackoverflow.com/questions/25674691/resize-image-without-imresize-matlab
function img = scale(I, scale)
	old = size(I);
	new = max(floor(scale .* old(1:2)), 1);
	rowi = min(round(((1:new(1))-0.5)./scale(1)+0.5), old(1));
	coli = min(round(((1:new(2))-0.5)./scale(2)+0.5), old(2));

	img = I(rowi, coli, :);
end
