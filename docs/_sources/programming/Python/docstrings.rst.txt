Python docstrings to generate Sphinx code documentation
#######################################################

In this section, I will show you how to use autodoc extension to generate code documentation in Sphinx.

Additions to conf.py for autodoc support
****************************************

You need to add thes few lines to your conf.py so Sphinx knows it should use autodoc extension and the path to your code to generate code documentation.

::

    import sys
    sys.path.append('path/to/the/folder/containing/your/code')
    extensions = ['sphinx.ext.autodoc']

Example
*******

This is an example of how to write docstrings provided in the following website https://thomas-cokelaer.info/tutorials/sphinx/docstring_python.html#module-template. 

.. literalinclude:: docstring_example.py

Result
******

.. automodule:: docstring_example
    :members:
    :undoc-members:
    :inherited-members:
    :show-inheritance:
