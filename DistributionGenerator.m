function [ theta, phi, pdf ] = DistributionGenerator( distributions_number,samples_number, alpha, distribution_name)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    if strcmp(distribution_name,'beckmann')
        eps1 = rand(distribution_number, samples_number);
        eps2 = rand(distribution_number, samples_number);
        phi = 2 * pi * eps2;
        theta = atan(sqrt(-alpha^2 * log(1-eps1)));

    end
    if strcmp(distribution_name, 'ggx')
    end
    if strcmp(distribution_name, 'phong')
    end
    pdf = {};
    for i = 1:distribution_numbers
        pdf{i} = histogram(theta(i,:), 'Normalization','probability');
        pdf{i}.BinEdges = linspace(0, pi/2,41);
    end
    
end

