%
%c0 = randn(100,1)*3;
%c1 = randn(50,1)*2 +10;
%c2 = randn(100,1)*3;
%c3 = randn(50,1)*2 +10;
%c0 = [c0 c2];
%c1 = [c1 c3];
%c0 = [c0' c1']';

k = 2;
mean = rand(k,2);
covs = rand(k,2,2);
pis = ones(k)/k;

steps = 2;

for i=1:steps
  gg = e(c0,k,mean,covs);
  suma = sum(gg .* pis);
  ggg = gg ./ suma;

  [n_mean,n_cov,n_pis] = m(ggg,c0)
end
