function [Xtrain,Xtest,Xval,Ytrain,Ytest,Yval] = data_splitting(X,Y)
    %the function data_splitting divides de dataset X with theirs
    %associated target Y into train, test, and validation sets
    [n,m] = size(X);
    idx_train = randperm(n,floor(0.7*n)); %roughly 70% of the datapoints in X
    idx_aux = setdiff(1:n,idx_train); %indexes of ~30% of the points taht are left for validation and testing
    n = length(idx_aux);
    idx_val = idx_aux(rand(1,n)>0.5); %roughly half of the indexes in idx_aux for validation
    idx_test = setdiff(idx_aux,idx_val); %the indexes of the points left in X that are not in train or val sets

    %use of the divided indexes to create the sets
    Xtrain = X(idx_train,:);
    Xtest = X(idx_test,:);
    Xval = X(idx_val,:);
    Ytrain = Y(idx_train);
    Ytest = Y(idx_test);
    Yval = Y(idx_val);
    
end