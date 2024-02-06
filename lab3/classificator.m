function classes_prob = classificator(points_classes)
  ncls = size(points_classes,1);
  classes_prob = zeros(2,ncls);
  for i=1:ncls
    classes_prob(1,ncls) = Gaussian(points_classes(i,:));
    classes_prob(2,ncls) = Gaussian(points_classes(i,:));
  end
end