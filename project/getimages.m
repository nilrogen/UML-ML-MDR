function L = getimages(path_fn)
  % get info about given path_fn
  L = dir(path_fn);
  % ignore '.' and "..'"
  L = L(3:length(L));
  % turn into cell array
  L = struct2cell(L);
  % keep the filenames throw out rest
  L = L(1,:);
end
