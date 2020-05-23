# Document format conversion

## Universal tool for document conversion: Pandoc

The full documentation can be found [here](https://pandoc.org/MANUAL.html).

### What is it?

Pandoc is a universal document converter that can convert between numerous markup and word processing formats, including Markdown, HTML, LaTeX and Word docx.

### Installing Pandoc

Using brew, choco, or directly from the [website](https://pandoc.org/installing.html) using the windows installer.

### Using Pandoc

Example: markdown to rst for a standalone file.

```
pandoc RL.md --from markdown --to rst -s -o RL.rst
```

Most important command line arguments: 
- Use -f or --from to specify the input file type .
- Use -t or --to to specify the output file type.
- Use -o to specify the file to write output to instead of stdout, types can be inferred from extensions.
- Use -s to convert to a standalone file as opposed to a fragment (e.g. a valid HTML file including ``<head>`` and ``<body>``).


## Extracting from pdf

- Extract the text from a pdf: https://www.newocr.com/
- PDF to word: https://pdf2docx.com/
