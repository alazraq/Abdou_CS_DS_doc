Clustering
##########
 
**Clustering** is the task of dividing the population or unlabeled data points into a number of groups such that data points in the same groups are more similar to other data points in the same group and dissimilar to the data points in other groups.
This grouping is done according to some similarity measure defined by combining the examples' features into a metric, called a **similarity measure**.

When each example is defined by one or two features, it's easy to measure similarity. For example, we can group music by genre to understand we have an affinity for a certain genre of music say hip hop, or group music by decade to understand how music was influenced by the sociopolitical climate.As the number of features increases, creating a similarity measure becomes more complex. 

In this tutorial we give an overview of the clustering workflow starting with data preparation, similarity metric design, the most prominent clustering algorithms, and clustering results interpretation following the excellent tutorial made available by Google `here <https://developers.google.com/machine-learning/clustering/workflow>`_.

.. toctree::
   :caption: Contents:
   :glob:

   clustering_data_preparation
   clustering_similarity_metrics
   clustering_algorithms
   clustering_results_interpretation