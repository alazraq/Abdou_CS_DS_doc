# Useful git commands

## Basic configuration

- Setting your user name
    ```
    git config --global user.name "<Your-Full-Name>"

- Setting your email
    ```
    git config --global user.email "<your-email-address>"

- Set your preferred git editor (for example for editing commit messages)
    ```
    git config --global core.editor "vim"
    git config --global core.editor "code --wait"

## Initialization

- Initialize an empty git repo in the current directory (create a .git folder in that directory)
    ```
    git init
- Clone locally an existing repository by making a full copy of it
    ```
    git clone <URL>


## .gitignore

- Download the standard Python.gitignore file by running this command in the root of your repo:
    ```
    curl https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore > .gitignore

## Status and viewing changes

- Check the status of working directory and staging area
    ````
    git status
- Show changes between HEAD and working directory
    ````
    git diff
- View commit history
    ````
    git log
- Show the list of commits in one line format
    ````
    git log --oneline
- View changes to a particular file or directory
    ````
    git log path/to/dir-or-file
- Details about a specific commit 
    ````
    git show hash_of_commit


## Add from working directory 

- Add a file to the staging area
    ````
    git add path/to/file

- Add all* files of a folder to the staging area
    ````
    git add path/to/dir

- Add all* files in the working directory (use with caution)
    ````
    git add .

PS: * Provided they are not listed in a specific .gitignore file containing the files that should be ignored

## Commit from staging area to working directory

- Commit everything in the staging area with a message 
    ````
    git commit -m "Your message"

- Editing previous commit: adding more changes or editing message
    ````
    The git commit --amend -m "New message"

- Skip staging area for tracked files
    ````
    git commit -a

## Tags 

- List all tags
    ````
    git tag

- Add a tag to the current version's HEAD
    ````
    git tag name_of_tag

- Delete a tag to the current version's HEAD
    ````
    git tag -d name_of_tag

## Aliases 
- The following command will add s the alias ``git hist`` for pretty printing commits log
    ```
    git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"

## Branching and checkout

- Checkout a specific commit
    ````
    git checkout commit-hash

- Checkout the n th parent of current commit 
    ````
    git checkout HEAD~n

- Checkout a parent of the current commit: ``HEAD^``is parent ``HEAD^^``grandparent etc
    ````
    git checkout HEAD^

- Create new branch

    ```
    git checkout -b [name_of_your_new_branch]
    git push origin [name_of_your_new_branch]
    ```

## Corrective actions

- Discard unstaged modifs 
    ````
    git checkout commit-hash 