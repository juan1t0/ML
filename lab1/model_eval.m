function plt = model_eval(train_X,test_X,Ds)
  n = length(Ds);
  train_Y = sin(2*pi*train_X) + randn(n,1)*0.3;
  test_Y = sin(2*pi*test_X) + randn(n,1)*0.3;
  train_errors = zeros(n,1);
  test_errors = zeros(n,1);
  for i=1:n
    [train_hat, w] = fitting(train_X,train_Y,Ds(i));
    train_errors(i,:) = eval(train_Y,train_hat);
    test_errors(i,:) = eval(test_Y,convert_x(test_X,Ds(i))*w);
  end

end
