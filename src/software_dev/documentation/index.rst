Documenting Software
####################

Documenting software is in my opinion one of the most important phases of software development. 
To me, a software that is not documented does not exist. Period.

All independent pieces of software should be documented. Typically, a single service (generally speaking, a single repository) inside a bigger project will have two documentations:

- **General documentation:** High-level overview of what that service does and how it is implemented. This should contain an overview of the service, instructions for CI/CD and deployments, and tutorials if some are needed. This should probably be contained in its own repo if the project is big enough and published to a website dedicated to the doc, or in the readme.rst (prefer .rst to .md) for smaller projects.

- **Code documentation:** Low-level code documentation for classes, packages, functions, variabes, etc. This documentation should be placed inside a specific folder (for example /docs folder) in the service’s repository. It should be generated automatically using pipelines and be made available online as well with proper authentication using GCP app engine for example.

.. toctree::

   general_doc/index
   code_doc/index