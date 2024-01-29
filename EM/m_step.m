%855899

function [new_mean,new_covM,new_pis] = m_step(X,Y,k,meanVs,covM,pis)
  N = length(Y); % total class points
  new_mean = zeros(size(meanVs)); % k x D, in this exercise D=2
  new_covM = zeros(size(covM)); % k x D X D
  new_pis = zeros(size(pis)); % k x 1

  d = sum(Y.*pis,1); % The sum of the P(X|Gaussians) multiplied by the respective pi, must be 1 x N.
  for i=1:k
    gamma = (pis(i)*Y(i,:))./d; % Calculation of P(gaussian=i|x) usign bayes' theorem

    new_mean(i,:) = sum(gamma.* X',2)/sum(gamma); % update of mean_i by sum of P(gaussian=i|x) * points divided by sum of P(gaussian=i|x)

    X_mu = X-new_mean(i,:); % auxiliar vector, is X - mean_i
    new_covM(i,:,:) = sum(gamma'.*(reshape(X_mu, [N,1,2]) .* reshape(X_mu, [N,2,1])),1) /sum(gamma); % reshape used to achieve vector multiplication giving 2x2 matrices
    % update of cov matrix by sum the P(gaussian=i|x) * [X-mean_i]*[X-mean_i]^T, divided by sum of P(gaussian=i|x)

    new_pis(i,:) = mean(gamma); % pi are updated as the mean of P(gaussian=i|x)
  end
end
