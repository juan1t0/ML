%855899

function results = multiDGaussian(points, meanV, covM)
    d = length(meanV); % capturing the data dimension
    covM = squeeze(covM); % convert 1x2x2 array to 2x2 matrix
    detCov = det(covM);

    points_mean = points - meanV;
    inner = points_mean / covM; % divide instead of calculating the inverse
    exponent = -0.5 * sum(inner .* points_mean, 2); % vertorizing "matrix multiplication" for each point by addition in 2d dim and .* of points

    norma = 1 / ((2 * pi)^(d / 2) * sqrt(detCov)); % normalization factor

    results = norma * exp(exponent);
end
