% Example usage:
meanVector = [1, 2];
covarianceMatrix = [2, 0.5; 0.5, 1];

points = [1.5, 2.5; 2.0, 1.8; 0.5, 3.0; 2.0, 1.8; 0.5, 3.0];
results = multiDGaussian(points, meanVector, covarianceMatrix);

disp(['The probability density at points is: ', num2str(results')]);
