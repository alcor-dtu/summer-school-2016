function [ theta, phi, pdf ] = DistributionGenerator( distributions_number,samples_number, alpha, distribution_name)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    eps1 = rand(distributions_number, samples_number);
    eps2 = rand(distributions_number, samples_number);

    if strcmp(distribution_name,'beckmann')
        phi = 2 * pi * eps2;
        theta = atan(sqrt(-alpha^2 * log(1-eps1)));
    end
    if strcmp(distribution_name, 'ggx')
        phi = 2 * pi * eps2;
        theta = atan(alpha*sqrt(eps1) ./ (sqrt(1 - eps1)));
    end
    if strcmp(distribution_name, 'phong')
        phi = 2 * pi * eps2;
        theta = acos(eps1.^(1.0 / (alpha + 2.0)));
    end
    pdf = zeros(distributions_number,40);
    for i = 1:distributions_number
        [N, ~] = histc(theta(i,:), linspace(0, pi/2,40)) ;
        pdf(i,:) = N / samples_number;
    end
    
end

