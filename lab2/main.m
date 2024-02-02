%855899

clear
load fisheriris;

#plotIris(meas,species); % Petal length Sepal length (3,2)

k = 5;

[classes_name,~,classes] = unique(species); %getting the classes names and a numberic values (1,2,3)

new_point = meas([1 5],:);

%class = knn(new_point, meas,k, classes);
%disp(classes_name(class,:));

[train_X,test_X,val_X,train_cls,test_cls,val_cls] = split(meas, classes); % split dataset

ks = [1 2 3 4 5 10 15 20 50]; % k values to test
accs = zeros(length(ks),1);
class_accs = zeros(length(ks), 3);

for i = 1:length(ks)
  val_cls_hat = knn(val_X,train_X,ks(i),train_cls); % calculation of pred for val set
  [accs(i,:),cl_acc] = metrics(val_cls,val_cls_hat,3,0); % calculation of acc from pred and real val set labels
  class_accs(i,:) = cl_acc;
end
%[top top_k] = max(accs); % find the "best" k value from val set
%top_k = ks(top_k);
%disp(top_k)
%[test_acc,test_class_acc] = metrics(test_cls,knn(test_X,train_X,top_k,train_cls),3,1); % acc for test set

accs = zeros(length(ks),1);
class_accs = zeros(length(ks), 3);

for i = 1:length(ks)
  test_cls_hat = knn(test_X,train_X,ks(i),train_cls); % calculation of pred for test set
  [accs(i,:),cl_acc] = metrics(test_cls,test_cls_hat,3,0);
  class_accs(i,:) = cl_acc;
end

plot_bars_accs(accs,class_accs,[3 3],ks,classes_name); %plot bars for test with each k value
figure();

color = lines(6);
gscatter(train_X(:,3),train_X(:,2),train_cls,color(4:6,:),'o');
hold on;
gscatter(test_X(:,3),test_X(:,2),test_cls,color(4:6,:),'X');
