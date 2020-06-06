# Overview of Packaging for Python

It is always a good idea to think about packaging before starting to write code. This overview provides a general-purpose decision tree for reasoning about Python’s packaging options.

There are two cases why you want to package your code:

1. You want to distribute your python libraries to other developers
2. You want to package a python application in a production setting

Both cases are covered in this tutorial.

## Use case 1: Packaging Python libraries

### Option 1: Python standalone modules (.py)

A Python file can be redistributed and reused as a module, provided it is written for the right version of Python, and only relies on the standard library.

Modules allow you to logically organize your python code

This is great for sharing simple scripts and snippets between people who both have compatible Python versions. However, this pattern won’t scale for projects that consist of multiple files, need additional libraries, or need a specific version of Python.

Example

### Option 2: Python source distributions (.tar.gz)

Example

### Option 3: Python binary distributions (.whl)

Example

### Complete tutorial of packaging a python library using setuptools library (in a setup.py file) and uploading it to PyPI

https://packaging.python.org/tutorials/packaging-projects/

### PyPI: Python Package Index

### PyPICloud: PyPI backed by S3 or GCS to host private repo for python packages

Very good step by step tutorial can be found [here](https://medium.com/@d.tresoldi5/deploying-a-pypi-server-in-minutes-with-gcp-17c6b0b92e79)

## Use case 2: Packaging Python applications



