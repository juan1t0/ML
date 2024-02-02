%855899

function plotIris(meas,species)
  subplot(2,3,1);
  gscatter(meas(:,1),meas(:,2),species);
  xlabel('Sepal length');
  ylabel('Sepal width');
  legend off;

  subplot(2,3,2);
  gscatter(meas(:,1),meas(:,3),species);
  xlabel('Sepal length');
  ylabel('Petal length');
  legend off;

  subplot(2,3,3);
  gscatter(meas(:,1),meas(:,4),species);
  xlabel('Sepal length');
  ylabel('Petal width');
  legend off;

  subplot(2,3,4);
  gscatter(meas(:,2),meas(:,3),species);
  xlabel('Sepal width');
  ylabel('Petal length');
  legend off;

  subplot(2,3,5);
  gscatter(meas(:,2),meas(:,4),species);
  xlabel('Sepal width');
  ylabel('Petal width');
  legend off;

  subplot(2,3,6);
  gscatter(meas(:,3),meas(:,4),species);
  xlabel('Petal length');
  ylabel('Petal width');
  legend off;
end
