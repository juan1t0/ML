%855899

function class = knn(np, X,k,classes)
  distances = pdist2(np,X); % distances between np points to X points
  [sor, idxs] = sort(distances,2); %sorting over rows
  nn = idxs(:,1:k); % taking k nearest
  class = mode(classes(nn),2);
end
