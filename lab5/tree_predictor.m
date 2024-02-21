function [pred,leave] = tree_predictor(point,tree)

    i = 1;
    option = true;
    while option
        node = tree(:,tree(1,:)==i);
        if node(3)==0
            pred = node(7);
            leave = i;
            break
        end
        if point(node(5)) < node(6)
            i = node(4);
        else
            i = node(3);
        end
    end
end