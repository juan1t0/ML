%855899

function [means, covs, pis] = param_init2D(k, X)
  means = rand(k,2); % random vector (from normal distr) of shape k x Dims=2
  pis = ones(k,1)/k; % Vector of same proportion for each gaussian
  covs = zeros(k,2,2); % array of the conv matrices
  for i=1:k
    covs(i,:,:) = cov(X); % Covariance matrix of sample, X must be a subset of the original data
  end
end
