%855899
function [Y_hat,w] = fitting(X,Y,d)
  X_t = convert_x(X,d); % addept X to perform the polynomial fitting
  w = X_t\Y; % calculation of w
  Y_hat= X_t*w; 
end
