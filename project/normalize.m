function X = normalize(X, l, h)
  minX = min(X(:));
  maxX = max(X(:));
  % Normalize [0...1].
  X = X - minX;
  X = X ./(maxX - minX);
  % Scale [low...high].
  X = X .*(h-l);
  X = X +l;
end
