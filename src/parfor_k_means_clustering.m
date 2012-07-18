function time = parfor_k_means_clustering(data_x, cluster_K, centroids)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tic;
data_x=double(data_x);
[~, data_width]=size(data_x);

convergence_diff=norm(centroids);
new_centroids=zeros(size(centroids));

while(convergence_diff)
    dists=zeros(cluster_K, data_width);
    parfor n=1:data_width
        dists(:,n)=distance_calculation(centroids,data_x(:,n));
        %dists(:,n)=(sum((repmat(data_x(:,n),1,cluster_K)-centroids).^2).^0.5)';%sum((data_x-repmat(centroids(:,n),1,data_width)).^2).^0.5;
    end
    %now dist is a cluster_k by data_width matrix
    [~, labels]=min(dists);
    for n=1:cluster_K;
        if isempty(data_x(:,labels==n))==0
            new_centroids(:,n)=mean(data_x(:,labels==n),2);
        else
            a=randi(data_width);
            new_centroids(:,n)=data_x(:,a);
            labels(a)=n;
        end
    end
    convergence_diff=norm(new_centroids-centroids);
    centroids=new_centroids;
end
time=toc;
end