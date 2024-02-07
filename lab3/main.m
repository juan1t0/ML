%855899
clear;
load DensityEstimationDataset;
GlassClassification = dlmread('GlassClassification.csv');
disp("DensityEstimationDataset");
[train_X,test_X,train_y,test_y] = split(DensityEstimationDataset(:,1:2),DensityEstimationDataset(:,3));
Sigma_D = zeros(3,2,2);
mu_D = zeros(3,2);
class_prob = zeros(3,1);
for i=1:3
  temp = train_X(train_y==(i-1),:);
  Sigma_D(i,:,:) = cov(temp);
  mu_D(i,:) = mean(temp);
  class_prob(i,:) = size(temp,1)/size(train_X,1);
end

pred = classificatorG(test_X,mu_D,Sigma_D);%.*class_prob';
[aux,pred] = max(pred,[],2);

[acc,class_accs] = metrics(test_y+1, pred, 3, 1);

%%%%%%GLASS
disp("\nGlassClassification");
[train_X,test_X,train_y,test_y] = split(GlassClassification(2:end,1:4),GlassClassification(2:end,5));
Sigma_G = zeros(2,4,4);
mu_G = zeros(2,4);
class_probG = zeros(2,1);
for i=1:2
  temp = train_X(train_y==(i),:);
  Sigma_G(i,:,:) = cov(temp);
  mu_G(i,:) = mean(temp);
  class_probG(i,:) = size(temp,1)/size(train_X,1);
end

pred = classificatorG(test_X,mu_G,Sigma_G);%.*class_prob';
[aux,pred] = max(pred,[],2);

[acc,class_accs] = metrics(test_y, pred, 2, 1);
