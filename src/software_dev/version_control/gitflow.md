# What is Gitflow:

Gitflow is a Git workflow design that defines a strict branching model designed around the project release. This provides a robust framework for managing larger projects with a scheduled release cycle. It assigns very specific roles to different branches and defines how and when they should interact.

# Gitflow ideas:

- 3 possible branches on a repo:
    1. release or master branch: used to ship product, tag all commits on the master branch with a version number
    2. dev: pull request to release, code reviwed by other team members
    3. feature branches: pull requests to merge in dev
    (+ type 4: hotfix branch see below )
- Pull requests are for letting other team members know what is going on, not for bug detection

- If an issue in master is detected a hotfix branch is created from master. Once the hotfix is complete it is merged to both develop and master