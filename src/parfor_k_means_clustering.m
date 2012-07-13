function [labels centroids] = parfor_k_means_clustering(data_x, cluster_K)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
data_x=double(data_x);
[data_height data_width]=size(data_x);

centroids=zeros(data_height,cluster_K);

for n=1:cluster_K
    for m=1:data_height
        centroids(m,n)=data_x(m,randi(data_width));
    end
end

convergence_diff=norm(centroids);
new_centroids=zeros(size(centroids));

while(convergence_diff)
    dists=zeros(cluster_K, data_width);
    parfor n=1:cluster_K
        dists(n,:)=sum((data_x-repmat(centroids(:,n),1,data_width)).^2).^0.5;
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

end