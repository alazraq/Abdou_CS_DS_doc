# Variable number of arguments: *args and **kwargs

This section is a summary of the [article](https://www.geeksforgeeks.org/args-kwargs-python/) by GeeksforGeeks on the subject.

## `*args`

The special syntax with the symbol ``*args`` in function definitions in python is used to pass a **non-keyworded**, variable-length argument list. The variable args can be thought of as a tuple that can contain a variable number of elements including 0.

Example:

```python
# Python program to illustrate 
# *args for variable number of arguments 
def myFun(arg1, *argv): 
	print ("First argument :", arg1) 
	for arg in argv: 
		print("Next argument through *argv :", arg) 

myFun('Hello', 'Welcome', 'to', 'GeeksforGeeks') 

```

outputs

```
First argument : Hello
Next argument through *argv : Welcome
Next argument through *argv : to
Next argument through *argv : GeeksforGeeks
```


## `**kwargs`

The special syntax ``**kwargs`` in function definitions in python is used to pass a **keyworded**, variable-length argument list. One can think of the variable kwargs as being a dictionary that maps each keyword to the value that we pass alongside it. That is why when we iterate over the kwargs there doesn’t seem to be any order in which they were printed out.

Example:

```python
# Python program to illustrate 
# *kargs for variable number of keyword arguments 

def myFun(**kwargs): 
	for key, value in kwargs.items(): 
		print ("%s == %s" %(key, value)) 

# Driver code 
myFun(first ='Geeks', mid ='for', last='Geeks')	 
```

outputs

```
last == Geeks
mid == for
first == Geeks
```

## Using ``*args`` and ``**kwargs`` to call a function

The syntax ``*args`` and ``**kwargs`` can be used to call a function having a certain number ofarguments by passing a tuple or a dictionary.

Example:

```python
def myFun(arg1, arg2, arg3): 
	print("arg1:", arg1) 
	print("arg2:", arg2) 
	print("arg3:", arg3) 
	
# Now we can use *args or **kwargs to 
# pass arguments to this function : 
args = ("Geeks", "for", "Geeks") 
myFun(*args) 

kwargs = {"arg1" : "Geeks", "arg2" : "for", "arg3" : "Geeks"} 
myFun(**kwargs) 

```

outputs

```
arg1: Geeks
arg2: for
arg3: Geeks
arg1: Geeks
arg2: for
arg3: Geeks
```


## Combining ``*args`` and ``**kwargs``

Example:

```python
def myFun(*args,**kwargs): 
	print("args: ", args) 
	print("kwargs: ", kwargs) 


# Now we can use both *args ,**kwargs to pass arguments to this function : 
myFun('geeks','for','geeks',first="Geeks",mid="for",last="Geeks") 
```

outputs

```
args: ('geeks', 'for', 'geeks')
kwargs {'first': 'Geeks', 'mid': 'for', 'last': 'Geeks'}
```



