function [Y_hat,w] = fitting(X,Y,d)
  X_t = convert_x(X,d);
  w = X_t\Y;
  Y_hat= X_t*w
end
