function g = e(x,k,m,c)
  g = zeros(k,size(x))
  for i=1:k
    g(i,:,:) = norm_samle(x,2,m(i),c(i));
  end
 end
