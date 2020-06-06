# Converting jupyter notebook into pdf, html or latex

In this tutorial, we use **nbconvert** to generae a pdf report from a jupyter notebook. The documation for nbconvert can be found [here](https://nbconvert.readthedocs.io/en/latest/usage.html).

## Modifications to make to the notebook before generating the pdf

- **Title:** The title of the pdf report is the name of the ipynb file.
- **Sections and subsections:** Subsequently, all ## in your notebook should become # etc
- **Lists in markdown:** Make sure all lists are preceded by an empty line to be taken into account in the pdf.

## Command line for conversion

Generate pdf, latex, html, markdown, rst etc:
    
    $ jupyter nbconvert --to pdf notebook.ipynb

Generate pdf report with table of content and chapters (att: code doesn't look as good)

    $ jupyter nbconvert --to pdf notebook.ipynb --template report

## Issues

It might be the case that generating the pdf doesn't go through because of missing latex packages, the best solution I found is to install each latex package individually. Here is how you do it from command line using TeX Live for example:

    tlmgr install <package>