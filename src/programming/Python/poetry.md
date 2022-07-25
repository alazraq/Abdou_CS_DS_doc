# Poetry basic usage

Poetry is a tool for dependency management and packaging in Python. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you.

We refer to the following [tutorial](https://python-poetry.org/docs/basic-usage/) to document basic usage of Poetry.

## Project setup 

### Creating a new project

- Command: 
    ```
    poetry new poetry-demo
    ```

### Initialising a pre-existing project

- Commands
    ```
    cd pre-existing-project
    poetry init
    ```

### Project structure ans toml file

A usual poetry project includes the following content (new project ``poetry-demo`` given as an example):

```
poetry-demo
├── pyproject.toml
├── README.rst
├── poetry_demo
│   └── __init__.py
└── tests
    ├── __init__.py
    └── test_poetry_demo.py
```

The ``pyproject.toml`` file is the most important here. It orchestrates your project and its dependencies and looks like this for a new project:

```toml
[tool.poetry]
name = "poetry-demo"
version = "0.1.0"
description = ""
authors = ["Sébastien Eustace <sebastien@eustace.io>"]

[tool.poetry.dependencies]
python = "*"

[tool.poetry.dev-dependencies]
pytest = "^3.4"
```

### Specifying dependencies

There are 2 ways to specify dependencies:

1. Specify them in the ``tool.poetry.dependencies`` section of the ``pyproject.toml`` file by specifying package names and version constraints (feel free to read more on how to specify version constraints [here](https://python-poetry.org/docs/dependency-specification/)).

    For example to add the pendulum dependency:

    ```toml
    [tool.poetry.dependencies]
    pendulum = "^1.4"
    ```
    It takes a mapping of package names and version constraints.

    Poetry uses this information to search for the right set of files in package “repositories” that you register in the tool.poetry.repositories section, or on PyPI by default.

2. Use the ``poetry add`` command:

    ```
    poetry add pendulum
    ```

    It will automatically find a suitable version constraint and install the package and subdependencies.

## Using poetry virtual environment

By default, poetry creates a virtual environment in ``{cache-dir}/virtualenvs`` (or ``{cache-dir}\virtualenvs`` on Windows).

There are several ways to run commands within this virtual environment.

### Using poetry run (to run scripts)

- To run your script in the default virtual env, simply use:

    ```
    poetry run python your_script.py
    ```
- Likewise if you have command line tools such as pytest or black you can run them using the run command, for example:
    ```
    poetry run pytest
    ```

### Using poetry shell (to activate th virtual env)

- The easiest way to activate the virtual environment is to create a new shell with:
    ```
    poetry shell
    ```
- To deactivate the virtual environment and exit this new shell type 
    ```
    exit
    ```
- To deactivate the virtual environment without leaving the shell use 
    ```
    deactivate
    ```

## Installing dependencies

To install the defined dependencies for your project, just run the install command.

```
poetry install
```

When you run this command, one of two things may happen depending on whether this is your first time installing and your project incudes no ``poetry.lock`` file or not:

1. If you have never run the ``poetry install`` command before and there is also no poetry.lock file present, Poetry simply resolves all dependencies listed in your pyproject.toml file and downloads the latest version of their files.
    
    When Poetry has finished installing, it writes all of the packages and the exact versions of them that it downloaded to the ``poetry.lock`` file, locking the project to those specific versions.

    > **Note:** You should commit the ``poetry.lock`` file to your project repo so that all people working on the project are locked to the same versions of dependencies (more below).

2.  Running install when a ``poetry.lock`` file is present resolves and installs all dependencies that you listed in ``pyproject.toml``, but Poetry uses the exact versions listed in ``poetry.lock`` to ensure that the package versions are consistent for everyone working on your project. 

    As a result you will have all dependencies requested by your ``pyproject.toml`` file, but they may not all be at the very latest available versions (some of the dependencies listed in the ``poetry.lock`` file may have released newer versions since the file was created). This is by design, it ensures that your project does not break because of unexpected changes in dependencies.