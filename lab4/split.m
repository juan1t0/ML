%855899

function [train_X,test_X,train_y,test_y] = split(X,y)
  [m,n] = size(X) ;
  idx = randperm(m); % random permutation of the points
  % split of 70% for train, 10% for validation and 20% for test
  train_X = X(idx(1:round(0.75*m)),:) ;
  test_X = X(idx(round(0.75*m)+1:end),:) ;
  train_y = y(idx(1:round(0.75*m)),:) ;
  test_y = y(idx(round(0.75*m)+1:end),:) ;

end

