.. _rst_syntax:

RST syntax tips
===============

A quick reference of rst syntax can be found
`here <https://docutils.sourceforge.io/docs/user/rst/quickref.html>`__.

-  Links:

::

   CNN link can be found `here <http://cnn.com>`_.

-  Blocks:

::

   ::

      pip freeze > requirements.txt

- Including a python file (code):

::

   .. literalinclude:: example.py

-  Referencing other sections (in other rst files from the same
   project):

   -  Giving a name to some section:

   ::

      .. _folder_organization:

      Folder Organization
      *******************

   -  Referencing that section:

   ::

      :ref:`folder_organization`.
