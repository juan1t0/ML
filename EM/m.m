function [m,cv,p] = m(y,x,mu)
  m = sum(y.*x)/sum(y);
  cv = sum(y.*(x-mu).^2)/sum(y)
  p = mean(y)
end
