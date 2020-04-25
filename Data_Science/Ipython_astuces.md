# Ipython astuces:

- For all built-in magic commands:

https://ipython.readthedocs.io/en/stable/interactive/magics.html

-  Autoreload imported modules before executing the code:

> %load_ext autoreload
> %autoreload 2

Example:

In [1]: %load_ext autoreload

In [2]: %autoreload 2

In [3]: from foo import some_function

In [4]: some_function()
Out[4]: 42

In [5]: # open foo.py in an editor and change some_function to return 43

In [6]: some_function()
Out[6]: 43


- Print all interactive variables, with some minimal formatting. 

For all variables, the type is printed. Additionally it prints:

For {},[],(): their length.

For numpy arrays, a summary with shape, number of elements, typecode and size in memory.

Everything else: a string representation, snipping their middle if too long.