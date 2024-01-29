%855899

function [mean,covMs,pis,n] = EM_algo(k,X,change)
  [mean,covMs,pis] = param_init2D(k,X(1:10,:)); % parameter initialization
  error = change +1;
  n=1;
  while error>change
    Y = e_step(X,k,mean,covMs); % Calculation of P(X|gaussians) with the currect parameters
    [mean_new,covMs_new,pis_new] = m_step(X,Y,k,mean,covMs,pis); % Updating of the parameters

    error = max([max(abs(mean-mean_new)(:)) max(abs(covMs-covMs_new)(:)) max(abs(pis-pis_new)(:))]); % Calculation of the maximum change in parameters
    mean = mean_new;
    covMs=covMs_new;
    pis=pis_new;

    n = n+1;
  end
end
