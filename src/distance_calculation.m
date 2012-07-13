function dists = distance_calculation( centroids, one_data_x)
%calculate all the distances between all centroids and one data
%instances

[~, centroids_width]=size(centroids);

dists=zeros(centroids_width, 1);

for n=1:centroids_width
    dists(n)=norm(centroids(:,n)-one_data_x);
end

end

