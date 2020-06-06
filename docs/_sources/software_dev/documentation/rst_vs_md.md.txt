# Markdown vs reStructuredText for writing documentation

Markdown and reStructuredText are two markup languages with plain text formatting syntax designed for easy input with any text editor. 

In short, rst is better than md. The only case you should be using md is for writing very short markup like forum comments, small docs like readmes, or when writing for an audience only familiar with md (which is indeed more popular). But you should definitely go wih rst for a fully-fledged documentation. Here is why:

1. **rst has more features:** footnotes, tables, citations and tables of contents for example.
2. **rst is much more standardized and uniform:** it was built on the basis of a comrehensive spec.
3. **rst has a built-in support for extensions:** Extension is a core design principle, and both custom roles (for inline elements) and directives (for block elements) can be easily added. It's therefore straightforward to add extensions for commonly-needed stuff like syntax-highlighted code blocks, math equations for Latex rendering and so on. With Markdown, to add an extension one has to modify the parser, which makes every Markdown implementation out there an island of its own.