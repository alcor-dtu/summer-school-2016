function [ classifiers ] = ComputeClassifier( labelled_data )
%COMPUTECLASSIFIER labelled_data contains N cells corresponding to N
%classes of data. Each cell contains a matrix with the data of the class,
%and a label corresponding to the class
%   labelled_data: {c1, c2,...cN};  ci ={data, label}
    
    N = length(labelled_data);
    labels = zeros(N,1);
    classifiers = cell(N,1);
    for i=1:N
       labels(i) = labelled_data{i}{2};
       data_i = labelled_data{i}{1};
       classifier_i = mean(data_i);
       classifiers{i} = {classifier_i, labels(i)};
    end

end

