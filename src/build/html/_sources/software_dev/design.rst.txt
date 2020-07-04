Designing Software
==================

Here, I mean by software design the activity following requirements
specification and before programming when you, as a software developper,
put together the initial structure of the project. There are multiple
sets of rules and design considerations to follow that many software
developpers have gethered, here I focus on the ones I encountred in my
experience designing software.

Separating configuration files from code
----------------------------------------

The separation of configuration from code is a good practice that makes 
your system customisable as you can load different configurations 
according to the environment you are running your application in.

- **Scala:** An Article on loading configurations in Scala from a file, from command line parameters or from environment variables is available `here <https://danielasfregola.com/2015/06/01/loading-configurations-in-scala/>`__.
-  **Python:** A complete article on loading configuration files in
   Python can be found
   `here <https://martin-thoma.com/configuration-files-in-python/>`__.

Packages naming conventions
---------------------------

Packages should be put in src folder under src/sourceset/language.
Please refer to :ref:`folder_organization` for more details.

The following packages naming conventions are the ones recommended by the official Java
documentaion but can be applied to any other programming language:

-  Package names are written in **all lower case** to avoid conflict
   with the names of classes or interfaces.
-  Use the **reversed internet domain name** of the company you are working
   for to begin your package names. For example, use
   com.company_x.project_y.mypackage for a package named mypackage
   created by a programmer working at a company whose internet domain name iscompany_x.com on project project_y.

Providing requirement files
---------------------------

Providing requirement files is a good practice to capture what libraries
are necessary for future developpers to run your software. The
requirement file, usually named ``requirements.txt``, contains a pinned
version of everything that was installed when pip freeze was run.

Here are two useful commands for capturing or installing requirements using a requirements file:

-  Freezing the requirements:

::

   pip freeze > requirements.txt

-  Installing the requirements from a file:

::

   pip install -r requirements.txt
