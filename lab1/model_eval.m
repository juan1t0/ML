%855899
function plt = model_eval(train_X,test_X,Ds)
  n = length(Ds); % number of degree tests
  train_n = length(train_X);
  test_n = length(test_X);
  train_Y = sin(2*pi*train_X) + randn(train_n,1)*0.3; % y values for train
  test_Y = sin(2*pi*test_X) + randn(test_n,1)*0.3; % y values for test
  train_errors = zeros(n,1); % init of errors vectors
  test_errors = zeros(n,1);
  for i=1:n
    [train_hat, w] = fitting(train_X,train_Y,Ds(i)); % finding y_hat for train and the w
    train_errors(i,:) = eval(train_Y,train_hat); % calculation of error (rmse) for train
    test_errors(i,:) = eval(test_Y,convert_x(test_X,Ds(i))*w); % calculation of error (rmse) for test
  end
  x = 1:n;
  plt = plot(x,log(train_errors),'r-o',x,log(test_errors),'b-o'); % plot of the errors values
end
