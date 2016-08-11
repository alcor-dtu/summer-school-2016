close all;
clear;
clc;


dataset_size = 100;
samples = 10;
bin_numbers = 41;

%% Beckmann Data

%smooth beckmann
a_smooth = 0.1;
% [smooth_t, smooth_phi, smooth_pdf] = DistributionGenerator(dataset_size, samples, a_smooth, 'beckmann');
%rough beckmann
a_rough = 0.5;
% [rough_t, rough_phi, rough_pdf] = DistributionGenerator(dataset_size, samples, a_rough, 'beckmann');
%super rough beckmann
a_very_rough = 0.99;
% [very_rough_t, very_rough_phi, very_rough_pdf] = DistributionGenerator(dataset_size, samples, a_very_rough, 'beckmann');
labels = [0.1, 0.4, 0.75 ,0.9];
supervised_size = 2;
[data, data_labels, supervised_data] = DataGenerator(dataset_size,samples,labels,supervised_size);


labelled_data = cell(length(labels),1);
for i=1:length(labels)
    labelled_data{i} = {supervised_data(1 + supervised_size*(i-1):supervised_size*i,:),labels(i)};
end

classifiers = ComputeClassifier(labelled_data);

[new_labels, distances] = LabelsPrediction(classifiers, data);
PlotBarycentric(distances);
corrected_guess = sum(data_labels==new_labels)/(dataset_size*length(labels)) * 100

while true
    old_labels = new_labels;
    for i=1:length(labels)
        labelled_data{i} = {data(old_labels==labels(i),:),labels(i)};
    end
    classifiers = ComputeClassifier(labelled_data);
    [new_labels, distances] = LabelsPrediction(classifiers, data);
    if (sum(new_labels - old_labels) == 0)
        break;
    end
    PlotBarycentric(distances);
    corrected_guess = sum(data_labels==new_labels)/(dataset_size*length(labels)) * 100

end
