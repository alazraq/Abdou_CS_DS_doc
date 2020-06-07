# Designing Software

Here I mean by software design the activity following requirements specification and before programming when you, as a software developper, put together the initial structure of the project. There are multiple sets of rules and design considerations to follow that many software developpers have gethered, here I focus on the ones I encountred in my experience designing software.

## Separating configuration files from code

The separation of configuration from code is a good practice that makes your system customisable as you can load different configurations according to the environment you are running it in.

- **Scala:** Article on loading configurations in Scala from a file, from command line parameters or from environment variables is available [here](https://danielasfregola.com/2015/06/01/loading-configurations-in-scala/).
- **Python:** A complete article on loading configuration files in Python can be found [here](https://martin-thoma.com/configuration-files-in-python/).

## Packages naming conventions

Packages should be put in src folder under src/sourceset/language. Please refer to XXXX.

These conventions are the ones recommended by the official Java documentaion but can be applied to any other programming language:

- Package names are written in **all lower case** to avoid conflict with the names of classes or interfaces.
- Use the reversed Internet domain name of the company you are working for to begin their package names. For example, com.company_x.project_y.mypackage for a package named mypackage created by a programmer at working at company_x.com on project project_y.

## Providing requirement files

Providing requirement files is a good practice to capture what libraries are necessary for future developpers to run your software. The requirement file usually named ``requirements.txt`` contains a pinned version of everything that was installed when pip freeze was run.

- Freezing the requirements:

```
pip freeze > requirements.txt
```

- Installing the requirements from a file:

```
pip install -r requirements.txt
```

## Creating a virtual environment for your project

In this section, I will show you how to use virtualenv and virtualenvwrapper for creating virtual environments. 

We use Virtual Environment so we can test python code in encapsulated environments and to also avoid filling our base Python installation with a bunch of libraries we might use for only one project.

### What are virtualenv and virtualenvwrapper?

- ``virtualenv`` is a tool to create isolated Python environments.
- ``virtualenvwrapper`` provides a set of commands which makes working with virtual environments much more pleasant (like the workon command) and places all your virtual environments in one place.

### Installing

```
$ pip install virtualenv
$ pip install virtualenvwrapper # or virtualenvwrapper-win if on Windows
$ export WORKON_HOME=~/Envs # or %USERPROFILE%\Envs if on Windows
$ source /usr/local/bin/virtualenvwrapper.sh
```

### Usage

- Creating a virtual environment:
    ```
    mkvirtualenv abdou_venv
    ```
- Activating the virtual environment:
    ```
    workon abdou_venv
    ```
- Installing some packages on the virtual environment: (from a requirements.txt file for example)
    ```
    pip install -r requirements.txt
    ```
- Deactivating the virtual environment:
    ```
    deactivate
    ````
- Deleting the virtual environment:
    ```
    rmvirtualenv venv
    ```