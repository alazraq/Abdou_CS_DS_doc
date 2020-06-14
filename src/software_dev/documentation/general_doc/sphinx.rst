Sphinx: Documentation generator
===============================

I like Sphinx very much, the proof being that the documentation you are
reading right now (Abdou_doc) was generated using Sphinx.

What is Sphinx?
---------------

Sphinx is a documentation generator or a tool that translates a set of
plain text source files into various output formats, the most famous
output formats being html, pdf, … That is, if you have a directory
containing a bunch of reStructuredText (rst) or Markdown (md) documents,
Sphinx can generate a series of HTML files, a PDF file (via LaTeX), and
much more.

In the next articles, you can read more about :ref:`rst_syntax`, :ref:`md_syntax` and :ref:`rst_vs_md`.

Installation
------------

::

   $ pip install -U sphinx

If this doesn’t work for you, all installation options can be found
`here <https://www.sphinx-doc.org/en/master/usage/installation.html>`__.

Jumping right into it: sphinx-quickstart
----------------------------------------

Sphinx offers an easy quickstart:

::

   $ mkdir my_doc
   $ cd my_doc
   # Sphinx quickstart command, select yes for splitting build and source, specify project name, developer's name and project release version
   $ sphinx-quickstart
   $ sphinx

This will generate inside my_doc folder the following structure:

::

   build/
   source/
       index.rst
   make.bat # If using Windows
   Makefile

-  The source folder is where you put your rst or md files used to
   generate the doc.
-  The build folder is where the generated html, latex etc go.
-  The Makefile (or make.bat batch file) contains all the instructions
   for the make command that you will use to generate the doc.

Command for doc generation
--------------------------

HTML doc for example can be generated using the following command:

::

   make html

Linking your doc with Github pages (for Github users)
-----------------------------------------------------

1. Create a ``docs`` folder alongside your doc root folder (my_doc or
   whichever folder contains the Makefile) and put both in a folder you
   will upload to github repo
2. Add a file named ``.nojekyll`` to the docs folder to turn off Jekyll
3. Add my_doc/build/ to your .gitignore
4. Add the following to the Makefile that sphinx generated for you under
   docsrc/Makefile
   ``github:         @make html         @cp -a _build/html/. ../docs``
   or the following to make.bat if you are on Windows:
   ``if "%1" == "github" (     %SPHINXBUILD% -M html %SOURCEDIR% %BUILDDIR% %SPHINXOPTS%     robocopy %BUILDDIR%/html ../docs /E > nul     echo.Generated files copied to ../docs     goto end     )``
   After the following line: ``if "%1" == "" goto help``
5. Then you can run ``make github`` from the my_doc directory to
   generate the docs and move them to where GitHub wants them (the docs
   folder)
6. On your github repo settings, activate github pages and select
   ``master branch /docs folder`` as the source
