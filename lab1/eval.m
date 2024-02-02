%855899
function error = eval(Y,Y_hat)
  error = sqrt(mean((Y-Y_hat).^2)); % root mean squared error
end
