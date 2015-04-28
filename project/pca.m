function [W, mu] = pca(X, y, k)
  [n,d] = size(X);
  mu = mean(X);
  Xm = X - repmat(mu, rows(X), 1);
  if(n>d)
    C = Xm'*Xm;
    [W,D] = eig(C);
    % sort eigenvalues/eigenvectors
    [D, i] = sort(diag(D), 'descend');
    W = W(:,i);
    % keep k components
    W = W(:,1:k);
  else
    C = Xm*Xm';
    [W,D] = eig(C);
    % multiply w/ data matrix
    W = Xm'*W;
    % normalize eigenvectors
    for i=1:n
      W(:,i) = W(:,i)/norm(W(:,i));
    end
    % sort eigenvalues/eigenvectors
    [D, i] = sort(diag(D), 'descend');
    W = W(:,i);
    % keep k components
    W = W(:,1:k);
  end
end
