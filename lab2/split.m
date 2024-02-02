%855899

function [train_X,test_X,val_X,train_y,test_y,val_y] = split(X,y)
  [m,n] = size(X) ;
  idx = randperm(m); % random permutation of the points
  % split of 70% for train, 10% for validation and 20% for test
  train_X = X(idx(1:round(0.7*m)),:) ;
  val_X = X(idx(round(0.7*m)+1:round(0.8*m)),:) ;
  test_X = X(idx(round(0.8*m)+1:end),:) ;
  train_y = y(idx(1:round(0.7*m)),:) ;
  val_y = y(idx(round(0.7*m)+1:round(0.8*m)),:) ;
  test_y = y(idx(round(0.8*m)+1:end),:) ;

end
