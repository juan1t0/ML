%855899
clear;
load DensityEstimationDataset;
GlassClassification = dlmread('GlassClassification.csv');

hist(DensityEstimationDataset(:,1), linspace(min(DensityEstimationDataset(:,1)), max(DensityEstimationDataset(:,1)), 200));