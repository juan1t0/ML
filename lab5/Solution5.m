clear
clc
close all

data = readmatrix('housing.txt');
X = data(:,1:13); %the datapoints
Y = data(:,14); %the target
[Xtrain,Xtest,Xval,Ytrain,Ytest,Yval] = data_splitting(X,Y); %split into train, test, and validation sets

[n,m] = size(X);

[tree, rmse_train] = tree_builder(Xtrain,Ytrain); %builds an unpruned tree and compute the rmse in the training set for tht tree
[pruned_tree] = tree_pruning(Xval,Yval,tree); %prunes the tree using the validation set


%compute the rmse for all the sets, for prunned and unprunned tree
pred1 = [];
pred2 = [];

for i = 1:length(Xtest)
    pred1 = [pred1; tree_predictor(Xtest(i,:),tree)];
    pred2 = [pred2; tree_predictor(Xtest(i,:),pruned_tree)];
end
rmse = [sqrt(mean((Ytest-pred1).^2)) sqrt(mean((Ytest-pred2).^2))];
pred1 = [];
pred2 = [];
for i = 1:length(Xtrain)
    pred1 = [pred1; tree_predictor(Xtrain(i,:),tree)];
    pred2 = [pred2; tree_predictor(Xtrain(i,:),pruned_tree)];
end
rmse(2,:) = [sqrt(mean((Ytrain-pred1).^2)) sqrt(mean((Ytrain-pred2).^2))];
pred1 = [];
pred2 = [];
for i = 1:length(Xval)
    pred1 = [pred1; tree_predictor(Xval(i,:),tree)];
    pred2 = [pred2; tree_predictor(Xval(i,:),pruned_tree)];
end
rmse(3,:) = [sqrt(mean((Yval-pred1).^2)) sqrt(mean((Yval-pred2).^2))];

bar(categorical({'Test','Train','Val'}),rmse)
legend(categorical({'Unprunned','Prunned'}))
title('RMSE in diferent sets')

