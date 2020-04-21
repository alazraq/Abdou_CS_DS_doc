# Abderrahmane Lazraq's Documentation

This documentation contains tutorials, tips and tricks learned by Abdou during his studies in four different institutions - EPFL, Carnegie Mellon University, Ecole Polytechnique and HEC Paris - and working part-time as a software developer and data science intern for more than 2 years for Virtual Traffic Lights LLC. 

The goal is to provide a centralized documentation for future reference if faced with similar tasks to accomplish and to share knowledge.

## Build the Doc

This documentation is compiled using Sphinx.
It can be compiled to several output formats including a static website and a PDF LaTeX document.

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
