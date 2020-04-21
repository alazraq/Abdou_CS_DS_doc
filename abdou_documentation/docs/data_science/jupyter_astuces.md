# Jupyter notebooks astuces

- Import functions from extrternal file in the same folder as ipynb file:

> from helpers import *

then functions can bu used directly as:

> height, weight, gender = load_data(sub_sample=False, add_outlier=False)