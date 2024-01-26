function X = convert_x(x,ex)
  n = length(x)
  exp = repmat(0:ex,n,1);
  x = repmat(x,1,ex+1);
  X = x.^exp;
end
