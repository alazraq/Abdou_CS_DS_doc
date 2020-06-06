Software Engineering
####################

Following good practices are used for Greengo:

#. Use git and the GitFlow workflow.
#. Use semantic versioning (see :ref:`semantic_versioning`).
#. Document a lot (see :ref:`service_documentation`).

Following good practices are **highly recommended**:

#. Use code reviews before merging to `dev` and `release` branches.
#. Use automated testing and deployment (for example by using Bitbucket pipelines).
#. Use automatic style checking tools.

.. _semantic_versioning:

Semantic Versioning
*******************

From the official `semantic versioning website <https://semver.org/>`_:

Given a version number MAJOR.MINOR.PATCH, increment the:

* MAJOR version when you make incompatible API changes,
* MINOR version when you add functionality in a backwards-compatible manner, and
* PATCH version when you make backwards-compatible bug fixes.
