# MAP 534 Introduction to ML: 
# Lecture 1: Dimension reduction: PCA and Kernel PCA

## Practical info
- https://sylvainlc.github.io/project/teaching/
- Practical sessions: Jupyter notebooks and additional R code (R studio)
- Evaluation: 
1. A practical lab on optimizatipon (5pt) --> One of the labs he will ask us to give back solutions, not necessarily the on on optimization
2. A Final exam (15pt)
## Machine Learning in a few words
1. Classification vs regression
2. Supervised vs unsupervised learning
3. Loss functions
## Dimensionality reduction
- Goal: find a low dimensional representation that captures the essential statistical properties of high-dimensional data: we do that by projecting the original data into a lower dimensional space where the new variables are combinations of the old variables
## Singular value decomposition
Why is it important: A in a n*d matrix, then we only have to store r(n+d) elements tostore sigma, u and v. Then we choose only the first largest sigmas, 2 or three first for example and we drop the pothers, this captures the most important trends in the data.
## Principal component analysis
- The original version of PCA: The objective is to reduce the dimension of Xi, we do this by using a linear transform, it means finding a dimension p= <d and a matrix W in R p*d to produce Xi_tilde = W * Xi
- Then to recover data, another matrix U in R d*p should be used to reconstuct data
- PCA s orthogonal projection: 
## Kernel principal component analysis

## Independent component analysis