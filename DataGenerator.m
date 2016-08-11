function [ data, labels, supervised_data ] = DataGenerator( size, samples, parameters, supervised_size )
%DATAGENERATOR Summary of this function goes here
%   Detailed explanation goes here
    N = length(parameters);
    data = [];
    labels = [];
    supervised_data = [];
    for i=1:N
        [ ~, ~, new_data ] = DistributionGenerator(size, samples, parameters(i), 'beckmann');
        sum(new_data,2);
        supervised_data = [supervised_data;new_data(randperm(size,supervised_size),:)];
        data = [data;new_data];
        labels = [labels; parameters(i)*ones(size,1)];
    end

end

