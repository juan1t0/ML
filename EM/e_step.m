%855899

function Y = e_step(X,k,mean,covM)
  Y = zeros(k,length(X)); % init of Y as vector (k x N)
  for i=1:k
    Y(i,:) = multiDGaussian(X,mean(i,:),covM(i,:,:)); % Calculation of P(x|gaussian=i) with current parameters for each gaussian
  end
 end
