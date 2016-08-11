function [ labels,distances ] = LabelsPrediction( classifier, unlabelled_data )
%LABELSPREDICTION predict a label for each unlabelled data
%   unlabelled_data: matrix NxM containing N unlabelled pdfs

    classes_size = length(classifier);
    unlabelled_size = size(unlabelled_data,1);
    distances = zeros(unlabelled_size, classes_size);
    for i = 1:classes_size
        
        class_pdf = classifier{i}{1};
        distances(:,i) = DistributionDistance(class_pdf, unlabelled_data);
        
    end
   
    [~, indices] = min(distances,[],2);
    labels= zeros(unlabelled_size, 1);
    for j=1:unlabelled_size
        indices(j);
        labels(j) = classifier{indices(j)}{2};
    end
  
end

