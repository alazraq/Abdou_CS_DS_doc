# Python main function 

## Python interpreter functionning

Whenever the Python interpreter reads a source file, it does two things:

- it sets a few special variables like ``__name__``, and then
- it executes all of the code found in the file sequentially.

## Setting up special variables

When the Python interpeter reads a source file, it first defines a few special variables. In this case, we care about the ``__name__`` variable. 

``__name__`` is a special variable in Python. If the source file is executed as the main program, the interpreter sets the`` __name__`` variable to have a value ``“__main__”``. If this file is being imported from another module, ``__name__`` will be set to the module’s name.

- If you are running your module (the source file) as the main program, e.g.
    ```
    python foo.py
    ````
    Then the interpreter will assign the hard-coded string "__main__" to the __name__ variable, i.e.

    ```python
    # It's as if the interpreter inserts this at the top
    # of your module when run as the main program.
    __name__ = "__main__" 
    ```
- When Your Module Is Imported By Another, which means there is a statement like this in the main program, or in some other module the main program imports:
    ```python
    # Suppose this is in some other main program.
    import foo
    ```
    The interpreter will search for your foo.py file, and prior to executing that module, it will assign the name ``"foo"`` from the import statement to the ``__name__`` variable, i.e.

    ```python
    # It's as if the interpreter inserts this at the top
    # of your module when it's imported from another module.
    __name__ = "foo"
    ```
## Executing the Module's Code Sequentially

After the special variables are set up, the interpreter executes all the code in the module, one statement at a time.

## Example

```python

# Suppose this is foo.py.

print("before import")
import math

print("before functionA")
def functionA():
    print("Function A")

print("before functionB")
def functionB():
    print("Function B {}".format(math.sqrt(100)))

print("before __name__ guard")
if __name__ == '__main__':
    functionA()
    functionB()
print("after __name__ guard")

```
Here is what gets printed in both cases:
- What gets printed if foo is the main program (if condition satisfied)

    ```
    before import
    before functionA
    before functionB
    before __name__ guard
    Function A
    Function B 10.0
    after __name__ guard
    ```

- What gets printed if foo is imported as a regular module (if condition not satisfied)

    ```
    before import
    before functionA
    before functionB
    before __name__ guard
    after __name__ guard
    ```

## Why Does It Work This Way?

You might wonder why anybody would want this. Well, sometimes you want to write a .py file that can be both used by other programs and/or modules as a module, and can also be run as the main program itself