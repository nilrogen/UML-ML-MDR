function [W, mu] = lda(X,y,k)
  % dimension of observation
  [n,d] = size(X);
  % number of classes
  labels = unique(y);
  C = length(labels);
  % allocate scatter matrices
  Sw = zeros(d,d);
  Sb = zeros(d,d);
  % mean
  mu = mean(X);
  % scatter matrices calculation
  for i = 1:C
    Xi = X(find(y == labels(i)),:); % sample w/ current class
    n = rows(Xi);
    mui = mean(Xi); % mean vector w/ current class
    Xi = Xi - repmat(mui, n, 1);
    Sw = Sw + Xi'*Xi;
    Sb = Sb + n * (mui - mu)'*(mui - mu);
  end
  % solve general eigenvalue
  [W, D] = eig(Sb, Sw);
  % sort
  [D, i] = sort(diag(D), 'descend');
  W = W(:,i);
  % keep at most (c-1) eigenvectors
  W = W(:,1:k);
end
