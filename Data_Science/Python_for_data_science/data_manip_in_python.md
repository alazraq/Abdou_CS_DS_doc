# Data manipulation in python astuces:

## Loading the data:
- Using numpy: 
> path_dataset = "height_weight_genders.csv"
> data = np.genfromtxt(path_dataset, delimiter=",", skip_header=1, usecols=[1, 2])
- Using pandas: