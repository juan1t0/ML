%855899
function X = convert_x(x,ex)
  n = length(x); % number of points
  exp = repmat(0:ex,n,1); % matrix for exponents, shape (n x ex+1), each row is [0 1 ... ex]
  x = repmat(x,1,ex+1); % matrix of X with repeated columns, so each column is [x1; x2; ... ;xn] 
  X = x.^exp;
  % element wise power to have the values of variables for the polynomial of degree ex
end
