# Python decorators

You can find a good article on Python decorators here: https://towardsdatascience.com/how-to-use-decorators-in-python-by-example-b398328163b

## Definition of a decorator

A decorator in Python is a function that takes another function as its argument, and returns yet another function.

## Usefullness

Decorators can be extremely useful as they allow the extension of an existing function, without any modification to the original function source code.

## Example

```python
def decorator_list(fnc):
    def inner(list_of_tuples):
        return [fnc(val[0], val[1]) for val in list_of_tuples]
    return inner


@decorator_list
def add_together(a, b):
    return a + b


print(add_together([(1, 3), (3, 17), (5, 5), (6, 7)])) # prints [4,20,10,13]
```

We modified the add_together function so it now takes a list of tuples.

The @ syntax above is symply the same as: 

```python
add_together = decorator_list(add_together)
```

## Decorators that can take arguments themselves

To use arguments in decorators, we simply need to define a decorator itself within a function that takes an argument and returns the decorator.

An example is provided below.

```python
def meta_decorator(power):
    def decorator_list(fnc):
        def inner(list_of_tuples):
            return [(fnc(val[0], val[1])) ** power for val in list_of_tuples]
        return inner
    return decorator_list


@meta_decorator(2)
def add_together(a, b):
    return a + b


print(add_together([(1, 3), (3, 17), (5, 5), (6, 7)]))
```