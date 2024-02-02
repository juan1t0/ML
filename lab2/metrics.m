%855899

function [acc,class_accs] = metrics(y_test, y_pred, nclasses, debug)
  acc = sum(y_test == y_pred) / length(y_test); % accuracy overall classes
  if debug
    disp(['Overall Accuracy: ', num2str(acc)]);
  end
  class_accs = zeros(1, nclasses);

  for i = 1:nclasses
      class_idx = y_test == i;
      class_accs(i) = sum(y_test(class_idx) == y_pred(class_idx)) / sum(class_idx); % accuracy over class i
      if debug
        disp(['Accuracy for Class ', num2str(i), ': ', num2str(class_accs(i))]);
       end
  end
end
