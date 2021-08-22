# Clustering results interpretation

## Step One: Quality of Clustering

- Visual inspection
- Clustering cardinality: **Number of elements per cluster** and investigate those with major outliers.
- Cluster magnitude: **sum of distances from all examples to the centroid of the cluster**. Similar to cardinality, check how the magnitude varies across the clusters, and investigate anomalies. 

## Step Two: Performance of the Similarity Measure

- Your clustering algorithm is only as good as your similarity measure.
- How to craft a simiarity measure: identify pairs of examples that are known to be more or less similar than other pairs. Then, calculate the similarity measure for each pair of examples. Ensure that the similarity measure for more similar examples is higher than the similarity measure for less similar examples.

## Step Three: Optimum Number of Clusters

- Try running the algorithm for increasing  and note the sum of cluster magnitudes. As  increases, clusters become smaller, and the total distance decreases. Plot this distance against the number of clusters (number of clusers vs Loss = sum of distances to centroids)
- at a certain k, the reduction in loss becomes marginal with increasing k. (Mathematically, that's roughly the  where the slope crosses above -1 or theta > 135 degrees)
- 