function results = multivariateGaussianSet(points, meanVector, covarianceMatrix)
    d = length(meanVector);
    invCovariance = inv(covarianceMatrix);
    detCovariance = det(covarianceMatrix);
    
    % Ensure points is a matrix
    points = reshape(points, [], d);
    
    % Calculate the exponent term for each point
    exponent = -0.5 * sum((points - meanVector) * invCovariance .* (points - meanVector), 2);
    
    normalization = 1 / ((2 * pi)^(d / 2) * sqrt(detCovariance));
    
    results = normalization * exp(exponent);
end