% test script 1
clear;
close all;
matlabpool open
load ../data/mnist;
tic
[labels centroids] = parfor_k_means_clustering(test_image, 10);
[labels centroids] = parfor_k_means_clustering(test_image, 10);
[labels centroids] = parfor_k_means_clustering(test_image, 10);
[labels centroids] = parfor_k_means_clustering(test_image, 10);
[labels centroids] = parfor_k_means_clustering(test_image, 10);
toc
tic
kmeans(test_image',10);
kmeans(test_image',10);
kmeans(test_image',10);
kmeans(test_image',10);
kmeans(test_image',10);
toc
matlabpool close