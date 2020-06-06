# Miscellaneous

## Shebang (#!) to select an interpreter in Linux 

A shebang is the character sequence consisting of the characters number sign and exclamation mark (#!).
It appears in a line of code in the beginning of a python file for example:

```python
#!/usr/bin/python
```

When a text file with a shebang is used as if it is an executable in a Unix-like operating system, the program loader mechanism parses the rest of the file's initial line as an interpreter directive, loads the specified interpreter and runs the file using that interpreter.

This has a couple of advantages:

- The script-writer has more control over which interpreter will be used (which solves the Python2/Python3 issue) and can sometimes pass an extra argument to the interpreter (see the Wiki page for details).
- The filename of the script is ignored, so you can name Python scripts whatever you want (not necessarily .py).

The shebang is optional in Linux.
In Windows, the interpreter is chosen based on the extension of the file, which has the disadvantage of not being able to distingish between python 3 and python 2 or name python files differently.


