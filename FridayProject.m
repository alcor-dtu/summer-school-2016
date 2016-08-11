close all;
clear;
clc;

rng(2);
dataset_size = 1;
data_size = 500;
bin_numbers = 41;
rho = ones(dataset_size, data_size);
%% Beckmann Data

%smooth beckmann
a_smooth = 0.1;
eps1 = rand(dataset_size, data_size);
eps2 = rand(dataset_size, data_size);
phi = 2 * pi * eps2;
theta_beckmann_smooth = atan(sqrt(-a_smooth^2 * log(1-eps1)));
[x, y, z] = sph2cart(phi,pi/2 - theta_beckmann_smooth,rho);
figure;
plot3(x, y, z, '.r');
axis equal;
xlim([-1,1]);ylim([-1,1]);zlim([0,1]);
xlabel('x');ylabel('y');zlabel('z');
title('Smooth Normals');
figure;
smooth_hist = histogram(theta_beckmann_smooth, 'Normalization','probability');
xlabel('\theta');
title('Smooth Distribution');
smooth_hist.BinEdges = linspace(0, pi/2,bin_numbers);
%rough beckmann
a_rough = 0.5;
eps1 = rand(dataset_size, data_size);
eps2 = rand(dataset_size, data_size);
phi = 2 * pi * eps2;
theta_beckmann_rough = atan(sqrt(-a_rough^2 * log(1-eps1)));
[x, y, z] = sph2cart(phi,pi/2 - theta_beckmann_rough,rho);
figure;
title('Rough Normals');
plot3(x, y, z, '.r');
axis equal;
xlim([-1,1]);ylim([-1,1]);zlim([0,1]);
xlabel('x');ylabel('y');zlabel('z');
figure;
title('Rough Distribution');
rough_hist = histogram(theta_beckmann_rough,'Normalization','probability');
xlabel('\theta');
rough_hist.BinEdges = linspace(0, pi/2,bin_numbers);
%super rough beckmann
a_super_rough = 0.99;
eps1 = rand(dataset_size, data_size);
eps2 = rand(dataset_size, data_size);
phi = 2 * pi * eps2;
theta_beckmann_super_rough = atan(sqrt(-a_super_rough^2 * log(1-eps1)));
[x, y, z] = sph2cart(phi,pi/2 - theta_beckmann_super_rough,rho);
figure;
plot3(x, y, z, '.r');
title('Super Rough Normals');
axis equal;
xlim([-1,1]);ylim([-1,1]);zlim([0,1]);
xlabel('x');ylabel('y');zlabel('z');
figure;
title('Super Rough Distribution');
super_rough_hist = histogram(theta_beckmann_super_rough, 'Normalization', 'probability');
xlabel('\theta');
super_rough_hist.BinEdges = linspace(0, pi/2,bin_numbers);


smooth_values = smooth_hist.Values;
rough_values = rough_hist.Values;
super_rough_values = super_rough_hist.Values;

smooth_rough_dist = -log(sum(sqrt(smooth_values .* rough_values)))
smooth_super_rough_dist = -log(sum(sqrt(smooth_values .* super_rough_values)))
rough_super_rough_dist = -log(sum(sqrt(super_rough_values .* rough_values)))

a_test = rand(1);
eps1 = rand(dataset_size, 20);
eps2 = rand(dataset_size, 20);
phi = 2 * pi * eps2;
theta_test = atan(sqrt(-a_test^2 * log(1-eps1)));
[x, y, z] = sph2cart(phi,pi/2 - theta_test,rho(1:20));
figure;
plot3(x, y, z, '.r');
title('Test Normals');
axis equal;
xlim([-1,1]);ylim([-1,1]);zlim([0,1]);
xlabel('x');ylabel('y');zlabel('z');
figure;
test_hist = histogram(theta_test,'Normalization','probability');
title('Test Distribution');
xlabel('\theta');
test_hist.BinEdges = linspace(0, pi/2,bin_numbers);
test_values = test_hist.Values;

smooth_dist = -log(sum(sqrt(smooth_values .* test_values)))
rough_dist = -log(sum(sqrt(rough_values .* test_values)))
super_smooth_dist = -log(sum(sqrt(super_rough_values .* test_values)))

aaa = histcounts(theta_test,'Normalization','probability');