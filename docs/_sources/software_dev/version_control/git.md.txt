# Git intoduction

## What is git?

Git is a distributed version-control system for tracking changes in source code during software development. It is designed for coordinating work among programmers, but it can be used to track changes in any set of files. There is a lot of version control software such as Subversion, Bazaar, etc. Git, however, is the most popular with more than 40M users. Git is also open-source.

## Characteristics of git
- Strong support for non-linear development
- Distributed development
- Safeguards (be able to access previous verions of your code)

## Some nomenclature

- ``HEAD`` is a reference to the last commit in the currently checked-out branch, ``HEAD~1`` or ``Head^`` the previous one etc

## Git configuration

Git has a command called ``config`` which takes an argument to specify which configuration levels to specify on:

- Use ``--system`` for system wide config (all users and all repos).
- Use ``--global`` for user wide config (just the operating user).
- Use ``--local`` for repository level config.

## Git initialization

The ``git init`` command creates an empty Git repository - basically a ``.git`` directory with subdirectories for ``objects``, ``refs/heads``, ``refs/tags``, and template files. An initial ``HEAD`` file that references the HEAD of the master branch is also created.

## How does git save work?
- ``Working directory (Untracked changes)``: also known as ``working tree`` is the area where you are currently working. It is where your files live.This area is also known as the “untracked” area of git. The ``git status`` command shows you the files in your working directory and the files in your staging area.
- ``Staging area (Tracked changes)``: also known as ``index`` is when git starts tracking and saving changes that occur in files. These saved changes reflect in the ``.git`` directory. Use ``git add`` command to move files from the working directory to the staging area. 
The Staging works on a per change basis (you have to restage your file after modifying it).
This [article](https://gitolite.com/uses-of-index.html#:~:text=staging%20helps%20you%20keep%20extra,practice%20but%20can%20happen%20sometimes) contains many reasons why the staging area is of use, among which the ability to split big changes into multiple commits, the ability to review changes etc.
- ``Local repository (Saved changes)``: it is everything in your ``.git`` directory. The git command ``git commit`` takes all changes in the Staging Area, wraps them together and puts them in your Local Repository. 

## Git commit tricks

### Modify previous commit

The git commit --amend command is a convenient way to modify the most recent commit. It lets you combine staged changes with the previous commit instead of creating an entirely new commit. It can also be used to simply edit the previous commit message without changing its snapshot. Use carefully because this completely overwrites the previous commit (changes history).

### Skip staging area for tracked files

The -a parameter on commit says to add all changes of **tracked** files (files already added to staging area at some point previously) and commit them. So ``git commit -a`` will not commit a new file you created. You must explicitly add this.