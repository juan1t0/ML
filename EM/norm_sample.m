function y = norm_sample(x,d,mu,cov)
  %y = zeros(size(x))
  const = (2*pi)^(d*0.5)*sqrt(det(cov));
  num = exp(-0.5 * (x-mu)' * inv(cov)*(x-mu));
  y = num / const;
end
