function [tree,rmse] = tree_builder(X,Y)

    %builds an unprunned tree using tha dataset [X,Y], the tree have the
    %following matrix format:
    %each column is a description of the nodes of the tree
    %|01|02|03|04|05|06|07|10 |11 | first line contain the name of the node
   
    %|00|01|01|02|02|03|03|05 |05 | 2th line have the father (from which node it comes from)
   
    %|03|05|07|00|11|13|15|00 |23 | 3th contain the rigth child (where the point goes if its feature is bigger than the rule)
   
    %|02|04|06|00|10|12|14|00 |24 | 4th contain the left child (where the point goes if its feature is less than the rule)
   
    %|f1|f2|f3|00|f5|f6|f7|00 |f11| 5th contain which of feature decide the
                                    %split
    %|r1|r2|r3|00|r5|r6|r7|00 |r11| 6th contain the value that split the
                                    %points
    %|n1|n2|n3|n4|n5|n6|n7|n10|n11| 7th contain the number of points from
                                    %the train set that pass trought that node 
    %|p1|p2|p3|p4|p5|p6|p7|p10|p11| 8th contain the prediction to the point
                                    %given they end up in that leave, we
                                    %also have it for other non-leave nodes
                                    %for later prunning

    %        Example of the tree showed with that matrix        

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
    %                         |   |         |   |         |

    %In this example, nodes 4 and 10 have their elemenst 3,4,5 and 6 (rigth
    %and left childs, and split rules) set to zero, indicating that they
    %are leaves of the tree (the reason being that the amount of points that went to 4 and 10 are less that the minimun set number)
    %there is also a rule to name the childs, they left is double the
    %father node, and the rigth is the left plus one (thats the reason why we dont have nodes 8 and 9 in the example)


    %data{i} contain the datapoints from the train set that get to node i
    data{1} = X; %the first node contain all the datapoints (because is before the 1th splitting of the dataset) 
    target{1} = Y; %target contain the value we want to predict
    [n,~] = size(X);

    i = 1;
    tree = [];
    option = true;

    while option
        if length(target{i})>20 %to ensure that if ni>20, the node should split the dataset again
            [feature,rule] = binary_splitting(data{i},target{i}); %function to check with feature and rule is better for the splitting
            pred = mean(target{i}); %prediction of that node
            node = [i; floor(i/2); 2*i + 1; 2*i; feature; rule;pred ;length(target{i})]; %acreating the node in the explained format
            tree = [tree, node]; %adding the node to the tree

            %dividing the dataset for the next childs
            idx = data{i}(:,feature)<rule; 
            data{2*i} = data{i}(idx,:);
            data{2*i+1} = data{i}(~idx,:);
            target{2*i} = target{i}(idx);
            target{2*i+1} = target{i}(~idx);
            max_son = 2*i + 1; %we check which is the maximum node created till now

        elseif length(target{i})<=20 && ~isempty(target{i}) %in the case the node satisfy the condition to be a leaf
            pred = mean(target{i}); %prediction of the leaf
            leaf = [i;floor(i/2);0;0;0;0;pred;length(target{i})]; %creating the node in the explained format
            tree = [tree leaf]; %adding the node to the tree
            option = (i ~= max_son); %if the maximum node created enter in this if, that means that we cannot split the dataset anymore
        end
        i = i + 1;
        % if i >200
        %     break
        % end
    end

    leaves = tree(1,tree(3,:)==0); %name of leaves
    %lets compute the SSE of the tree based in the train set
    sse = 0;
    for i = 1:length(leaves)
        sse = sse + sum((target{leaves(i)}-mean(target{leaves(i)})).^2);
    end
    %use the SSE to compute the RMSE
    rmse = sqrt(sse/n);


end