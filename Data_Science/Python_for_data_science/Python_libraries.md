# Essential Data Science Python packages

Here is a list of the most important Python packages that every Data Scientist should be familiar with.

- numpy:
- pandas
- matplotlib and seaborn:
- scipy:
- scikit-learn: Scikit-Learn is a Python module for machine learning built on top of SciPy and NumPy.
- sympy:
- pytorch: developed by facebook, much easier to use than tensorflow --> recommended by prof
- tensorflow: developed by google, maybe bigger community
- Keras: high level, easy to use but less freedom
- CUDA: Libraries for your computer to send your algo to run on GPUs on a cluster


# Differences:

- Numpy vs Scipy:


NumPy stands for Numerical Python while SciPy stands for Scientific Python. Both NumPy and SciPy are modules of Python, and they are used for various operations of the data. 

Coming to NumPy first, it is used for efficient operation on homogeneous data that are stored in arrays. In other words, it is used in the manipulation of numerical data. NumPy makes Python an alternative to MatLab, IDL, and Yorick. 

Coming to SciPy, it is actually a collection of tools for Python. These tools support operations like integration, differentiation, gradient optimization, and much more. The reason for using them over other available popular tools in the market is their speed. As a matter of fact, all the general numerical computing is done via SciPy in Python.


SciPy has been written on the top of NumPy and can perform many tasks. The sub-modules of SciPy are following

Special functions (scipy.special)
Integration (scipy.integrate)
Optimization (scipy.optimize)
Interpolation (scipy.interpolate)
Fourier Transforms (scipy.fftpack)
Signal Processing (scipy.signal)
Linear Algebra (scipy.linalg)
Sparse Eigenvalue Problems with ARPACK
Compressed Sparse Graph Routines (scipy.sparse.csgraph)
Spatial data structures and algorithms (scipy.spatial)
Statistics (scipy.stats)
Multidimensional image processing (scipy.ndimage)
File IO (scipy.io)