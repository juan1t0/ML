%855899

function Y = MixtureGaussians(k,X,meanVs,covMs,pis)
  Y = zeros(size(X,1),1); % init of Y as vector (Nx1)
  for i=1:k
    Y = Y + pis(i)*multiDGaussian(X, meanVs(i,:), covMs(i,:,:)); % sum of each gaussian(X) multipl by respective pi
  endfor
end
