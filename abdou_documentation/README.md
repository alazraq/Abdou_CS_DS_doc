# Abdou's Documentation

This is the documentation of everything Abdou managed to learn working as a software developer, the goal is to have a centralized documentation to refer to if faced with similar tasks to accomplish.

## Build the Doc

This documentation is compiled using Sphinx.
It can be compiled to several output format including a static website and a PDF LaTeX document.

### Online -- not yet done

The online documentation is automatically updated when a new verison is merged into master.
See the bitbucket pipeline for details.

### Locally

You might want to compile the documentation locally if you want to generate an output format which is not automatically built or if you want to check that your modifications are working properly.

For a local setup, please follow the instructions hereafter.

#### Setup (One Time Only)

You need Python3, `virtualenv` and `virtualenvwrapper` installed.
Inside the repository root folder, issue the following commands:

- `mkvirtualenv abdou_doc`
- `pip3 install -r requirements.txt`

#### Generating Output Formats

Run `workon abdou_doc && make <format>` inside the `docs` folder, where `<format>` is replaced with the output format of interest, for example `html` or `latexpdf`.
The output format will be generated in `docs/_build/<format>`.

For web, open `docs/_build/html/index.html` in a web browser.

### Teardown

To deactivate the virtual environment run `deactivate`.
