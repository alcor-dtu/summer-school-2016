clear;
clc;
close all;

rng(2);
mu1 = 1;
sigma1 = sqrt(0.2);
dataset_size = 100;
g_1 = normrnd(mu1, sigma1, [2, dataset_size]);
mu2= -1;
sigma2 = sigma1;
g_2 = normrnd(mu2, sigma2, [2, dataset_size]);
dataset = [g_1, g_2]';
plot(g_1(1,:), g_1(2,:), '.k');
hold on;
plot(g_2(1,:), g_2(2,:), '.k');
axis equal;

%generate random labelled data
l1 = g_1(:, randperm(dataset_size));
l2 = g_2(:, randperm(dataset_size));
 l1 = sort(g_1,2,'descend');
 l2 = sort(g_2,2,'descend');
train_size = 2;
t1 = l1(:,1:train_size)';
t2 = l2(:,1:train_size)';
%compute the mean of the labelled data
mean1 = mean(t1);
mean2 = mean(t2);
label = ones(1,  2);
label(1) = 1;
label(2) = -1;
plot(t1(:,1), t1(:,2), '.r', 'MarkerSize', 15);
plot(t2(:,1), t2(:,2), '.b', 'MarkerSize', 15);
plot(mean1(:,1),mean1(:,2),'.g', 'MarkerSize', 15);
plot(mean2(:,1),mean2(:,2),'.g', 'MarkerSize', 15);
%train a nearest mean classifier
mdl = fitcknn([mean1; mean2], label');
%assign label to unlabelled data
predicted_labels = predict(mdl, dataset);
ll1 = dataset(predicted_labels==label(1),:);
ll2 =  dataset(predicted_labels==label(2),:);
figure;
hold on;
axis equal;
plot(ll1(:,1), ll1(:,2), '.r', 'MarkerSize', 15);
plot(ll2(:,1), ll2(:,2), '.b', 'MarkerSize', 15);
    mean1 = mean(ll1);
    mean2 = mean(ll2);
    plot(mean1(:,1),mean1(:,2),'.g', 'MarkerSize', 15);
plot(mean2(:,1),mean2(:,2),'.g', 'MarkerSize', 15);
labels = [];
iteration = 0;
%% self training
while true
    labelled_dataset = [ll1; ll2];
    labels = predicted_labels;
    mean1 = mean(ll1);
    mean2 = mean(ll2);
    new_mdl = fitcknn([mean1;mean2], label');
    new_labels = predict(new_mdl, labelled_dataset);
    iteration = iteration+1
    %if the label don't change, stop self training
    if (sum(new_labels - labels) == 0)
        break;
    end
    predicted_labels = new_labels;
    ll1 = dataset(predicted_labels==1,:);
    ll2 =  dataset(predicted_labels==-1,:);
    figure;
hold on;
axis equal;
plot(ll1(:,1), ll1(:,2), '.r', 'MarkerSize', 15);
plot(ll2(:,1), ll2(:,2), '.b', 'MarkerSize', 15);
plot(mean1(:,1),mean1(:,2),'.g', 'MarkerSize', 15);
plot(mean2(:,1),mean2(:,2),'.g', 'MarkerSize', 15);
end
