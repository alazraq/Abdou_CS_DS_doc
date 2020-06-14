General Documentation
#####################

The general documentation of a service is high level and covers everything that a developper who is new to the project needs to know to start coding immediately after reading it. 
It contains everything from the design of the service and input/output, to development history, assumptions, simplifications and possible improvements.

Here we explore the most important markup languages commonly used for writing general documentation and 

The Process of deploying the general documentation and code documentations should be automized using pipelines and should trigger upon commiting to a release branch. 
For smaller projects it is acceptable to have the doc of each service in its corresponding Readme.rst but as the system gets bigger and more compicated, the documentation should be in its own repo to allow some parts of the doc to reference others, and should probably be written in rst which offers much more features than md, and built using Sphinx. 
Sphinx is a tool to create beautiful documentation, in fact, this doc you are currently reading is built using `Read the Docs Sphinx Theme <https://github.com/readthedocs/sphinx_rtd_theme>`__.

.. toctree::

   sphinx
   rst_syntax
   markdown_syntax
   rst_vs_md
   


