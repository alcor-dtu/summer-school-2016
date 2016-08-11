function [  ] = PlotDistribution( histogram_values )
%PLOTDISTRIBUTION Summary of this function goes here
%   Detailed explanation goes here
    nBins = length(histogram_values);
    figure;
    stem(linspace(0,pi/2,nBins),histogram_values);
    xlabel('\theta');
    ylabel('Probability');
    
end

