function classes_prob = classificatorG(test_X,mu_D,Sigma_D)
  ncls = size(mu_D,1);
  N = size(test_X,1);
  classes_prob = zeros(N,ncls);
  for i=1:ncls
    classes_prob(:,i) = Gaussian(test_X,mu_D(i,:),Sigma_D(i,:,:));
  end
end
