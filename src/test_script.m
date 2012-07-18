% test script 1
clear;
close all;
matlabpool open;
load ../data/mnist_test
time = parfor_k_means_clustering(training_image, 10, centroids)
matlabpool close;