clear;
clc;
close all;

rng(2);
mu1 = 1;
sigma = sqrt(0.05);
dataset_size = 2000;
A1 = normrnd(mu1, sigma, [2, dataset_size]);
mu2= -1;
A2 = normrnd(mu2, sigma, [2, dataset_size]);
mub = 0;
B = normrnd(mub, sigma, [2, dataset_size]);

A = [A1 , A2];
plot(A(1,:), A(2,:), '.r');
hold on;
plot(B(1,:), B(2,:), '.b');
axis equal;
