# Clustering algorithms


## K-means: Clustering based on partition

To cluster data into  clusters, k-means follows the steps below

- Step 1: The algorithm **randomly chooses a centroid** for each cluster. Ex: k = 3, the algorithm randomly picks 3 centroids.
- Step 2: The algorithm **assigns each point to the closest centroid** to get k initial clusters.
- Step 3: For every cluster, the algorithm **recomputes the centroid by taking the average** of all points in the cluster. 
- Step 4: Repeat step 2 and step 3 until the oints stop changing clusters (convergence) or reaching other set criteria (max steps).

## BIRCH: Hierarchical clustering

- Why: 
    - K-means always tries to make clusters of the same size.
    - In K-means we have to decide the number of clusters at the beginning of the algorithm.

- Types:
    - Agglomerative hierarchical clustering
        - We assign each point to an individual cluster in this technique. Suppose there are 4 data points. We will assign each of these points to a cluster and hence will have 4 clusters in the beginning.
        - Merge closest pair of clusters and repeat until there is a single cluster left
    - Divisive Hierarchical clustering: start with one big cluster and split the furthest point out in each step

## DBSCAN: Clustering based on density

- **Name**: Density-Based Spatial Clustering of Applications with Noise.
- **Why**: K-Means and Hierarchical Clustering both fail in creating clusters of arbitrary shapes (concentric circles for example)
- **What:** It groups ‘densely grouped’ data points into a single cluster (using Euclidian distance).
- **Parameters:** DBSCAN requires only two parameters: 
    - **epsilon** is the radius of the circle to be created around each data point to check the density and 
    - **minPoints** is the minimum number of data points required inside that circle for that data point to be classified as a Core point. minPoints>=Dimensions+1.
- **How:** DBSCAN creates a circle of epsilon radius around every data point and classifies them into Core point, Border point, and Noise according to the number N of points inside their circle. 
    - N > minPoints -> data point is a **Core point** 
    - 0 < N < minPoints -> datapoint is a  **Border Point**
    - N = 0 -> data point is **Noise**

    - Reachability: if a point can be accessed from another
    - Connectivity: they are in the same cluster
    - X is **Directly Density-Reachable** from Y:
        - X is in the circle of Y
        - Y is a core point
    - X is **Density-Reachable** from Y if X can be reached from Y through core points in the middle
    - X is **density-connected** from point Y if there is a point O in the middle where X and Y are both density reachable from O.