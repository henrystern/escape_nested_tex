# Overview

A Quarto extension that fixes the "erroneous nesting of equation structures" error when rendering a quarto document to PDF.

Mathjax supports nested equation structures in the form:

```latex
$$
  \begin{align*}
    x^2
  \end{align*}
$$
```

Latex does not, instead requiring:

```latex
\begin{align*}
  x^2
\end{align*}
```

The Latex syntax interferes with treesitter parsing and RStudio's live preview feature.

This extension converts the Mathjax compatible syntax to Latex compatible syntax on render.

## Installation

To install this extension in your current directory (or into the Quarto project that you're currently working in), use the following command:

```bash
quarto add henrystern/escape_nested_tex
```

This will install the extension under the `_extensions` subdirectory.

## Usage

To enable the extension, add it as a filter in your documents YAML header.

```yaml
filters:
  - escape_nested_tex
```

## Example

This [example](example.qmd) shows equation environments that would usually cause a Latex error. With the extension enabled it renders accurately to both [HTML](example.html) and [PDF](example.pdf).
