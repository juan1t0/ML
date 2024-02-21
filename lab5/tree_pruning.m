function [pruned_tree,loss] = tree_pruning(X,Y,tree)
    %takes a tree and prunned with respect of [X Y] (validation set)
    [n,m] = size(X);
    data = cell(1,max(tree(1,:))); %data{i} contain all the datapoint of X that gets to node i
    target = cell(1,max(tree(1,:))); % similiar as data{i} but with Y

    %compute data for the validation set
    for i = 1:n
        [~,node] = tree_predictor(X(i,:),tree);

        data{node} = [data{node};X(i,:)];
        target{node} = [target{node};Y(i,:)];
    end

    leaves = tree(:,tree(3,:)==0); 
    to_prune = unique(leaves(2,:)); %compute all the father of the leaves
    idx = [];
    %compute wich of this father cannot be prunned
    for i =1:length(to_prune)
        if sum(tree(3,tree(2,:)==to_prune(i)))>0
            idx = [idx,i];
        end
    end
    to_prune(idx) = []; %eliminate those father that cannot be prunned
    %example of prunnable and unprunnable trees:
    %                           1
    %             ______________|______________
    %             |                           |
    %             2                           3
    %      _______|_______             _______|_______
    %      |             |             |             |
    %      4             5             6             7
    %               _____|_____   _____|_____   _____|_____
    %               |         |   |         |   |         |
    %              10        11  12        13  14        15
    
    % 4,10,11,12,13,14 and 15 are leaves, so their fathers are: 2,5,6 and 7
    %5,6 and 7 are prunable just because all their children are leaves, 2
    %is not because it does not satisfies that condition:)))


    while ~isempty(to_prune) %loop till there is no more prunnable nodes 

        aux = tree(:,tree(1,:)==to_prune(1));
        data{to_prune(1)} = [data{aux(3)};data{aux(4)}];
        target{to_prune(1)} = [target{aux(3)};target{aux(4)}];
        %SSE without prunning
        sse1 = sum((target{aux(3)}-tree(7,tree(1,:)==aux(3))).^2) + sum((target{aux(4)}-tree(7,tree(1,:)==aux(4))).^2);
        %SSE prunned
        sse2 = sum((target{to_prune(1)}-tree(7,tree(1,:)==to_prune(1))).^2);
        
        if sse2<sse1
            %if we prunned, we need to:
            tree(:,tree(1,:)==aux(3)) = []; %eliminate the children from the tree
            tree(:,tree(1,:)==aux(4)) = [];
            tree(3:4,tree(1,:)==to_prune(1)) = 0; %modify the father to be a leave
            %check for its father of the new leaf to see if it is a prunnable node
            father = tree(:,tree(1,:)==aux(2)); 
            sone = tree(:,tree(1,:)==father(3));
            sond = tree(:,tree(1,:)==father(4));
            if (sone(3) + sond(3))==0;
                to_prune = [to_prune father(1)];
            end
        end

        to_prune(1) = []; % it does not matter if the node is prunned or not, it is delete it from the list either way (because by this moment was already prunned or it is not necessary to prune)
        
    end
    pruned_tree = tree;
end