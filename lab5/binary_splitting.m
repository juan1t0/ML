function [feature,rule] = binary_splitting(X,Y)
    %receive a dataset (X,Y), and choose a feature in X and a value (rule)
    %that better divide the dataset with respect of Y
    [n,m] = size(X);
    err = sum((Y - mean(Y)).^2); %initialize the error, takes a model that predict the mean of Y for every point
    for j = 1:m
        [~,aux1] = min(X(:,j));
        [~,aux2] = max(X(:,j));
        idx = setdiff(1:n,[aux1,aux2]);
        candidates = X(idx,j); %all the values of the feature j of X except by the maximum and the minimum
        for i = 1:length(candidates)
            Y_dir = Y(X(:,j)>=candidates(i));
            Y_esq = Y(X(:,j)<candidates(i));
            err_act = sum((Y_dir - mean(Y_dir)).^2) + sum((Y_esq - mean(Y_esq)).^2); %compute the SSE of the splitting
            if err_act<err
                %if the error is less than the minimu recorded, that means
                %that that combination is better than any past other:
                err = err_act; 
                feature = j;
                rule = candidates(i);
            end
        end
        % Y_dir = Y(X(:,j)>=mean(X(:,j)));
        % Y_esq = Y(X(:,j)<mean(X(:,j)));
        % err_act = sum((Y_dir - mean(Y_dir)).^2) + sum((Y_esq - mean(Y_esq)).^2);
        % err_act = sqrt(err_act/n);
        % if err_act<err
        %     feature = j;
        %     rule = mean(X(:,j));
        % end

    end
   
end