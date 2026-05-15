# Scriptorium — LaTeX

Minimal literary class built on top of `memoir`.

Scriptorium is designed for atmospheric fiction, serialized narratives, pericopes, and book-like typography. It provides a restrained editorial style inspired by late nineteenth-century printing, while remaining lightweight and practical for modern writing workflows.

Originally developed for *Le Livre des Ombres* and *L'Angle Mort*.

---

## Features

- built on top of `memoir`
- pocket and hardcover layouts
- automatic title pages
- literary chapter and scene styling
- drop caps / lettrines
- scene separators
- narrative notes and quotations
- SMS-style dialogue blocks
- bilingual support (`french` / `english`)
- automatic color / grayscale handling
- Libertinus Serif typography
- microtypographic refinements

---

## Installation

Copy:

```text
scriptorium.cls
```

into:
- your project directory,
- or your local TeX tree.

---

## Recommended engine

Preferred:
- XeLaTeX
- LuaLaTeX

Supported:
- pdfLaTeX

XeLaTeX or LuaLaTeX are recommended for:
- historic ligatures,
- typography quality,
- Unicode handling.

---

## Basic usage

```latex
\documentclass[hardcover,french,color]{scriptorium}

\title{L'Angle Mort}
\author{Calion}

\publicationyear{2026}

\website{libricalionis.com}
\contactemail{libri.calionis@gmail.com}

\begin{document}

  \maketitle

  \mainmatter

  \chapter{Le sens est là, personne ne le voit}

  \section{La gare}

  \lettrine{L}{a} pluie tombait sur les verrières de la gare. Je restai un moment sous l'horloge.

  \theend

\end{document}
```

---

## Class options

### Edition format

#### `hardcover`

Default larger edition.

```latex
\documentclass[hardcover]{scriptorium}
```

#### `pocket`

Compact paperback-style edition.

```latex
\documentclass[pocket]{scriptorium}
```

---

### Language

#### `french`

French typography and interface text.

```latex
\documentclass[french]{scriptorium}
```

#### `english`

English typography and interface text.

```latex
\documentclass[english]{scriptorium}
```

---

### Color handling

#### `color`

Enable color palette.

```latex
\documentclass[color]{scriptorium}
```

#### `nocolor`

Automatic grayscale mode.

```latex
\documentclass[nocolor]{scriptorium}
```

This also switches title illustrations automatically when both variants are defined.

---

### Scene handling

#### `scenepagebreak`

Each `\section` starts on a new page.

#### `noscenepagebreak`

Continuous flow between scenes (default).

---

## Available commands

### Title metadata

```latex
\title{...}
\author{...}

\publicationyear{...}

\website{...}
\contactemail{...}

\titleimagecolor{...}
\titleimagegrayscale{...}
```

---

### Title pages

```latex
\maketitle
```

Automatically generates:
- title page,
- liminary publication page.

---

### Scene separator

```latex
\scenebreak
```

---

### Narrative notes

#### Generic note

```latex
\scriptoriumnote{
Text...
}
```

#### Signed Calion note

```latex
\calionnote{
Text...
}
```

---

### Narrative quotations

```latex
\scriptoriumquote{
Text...
}
```

---

### SMS dialogue

```latex
\smsa{Message}
\smsb{Reply}
```

---

### Figure highlighting

```latex
\figura{Jonas}
```

---

### Final marker

```latex
\theend
```

Automatically displays:
- `Fin`
- or `The End`

depending on the selected language.

---

## Typography

Scriptorium uses:
- Libertinus Serif,
- restrained spacing,
- minimal ornamentation,
- balanced margins,
- moderate line height,
- subtle color accents.

The class intentionally avoids:
- decorative excess,
- heavy graphical effects,
- over-engineered layouts.

The goal is literary rhythm and long-form readability.

---

## Repository structure

```text
latex/
├── README.md
├── scriptorium.cls
├── example.tex
```

---

## License

MIT License.

---

## Author

Calion — writer and builder of quiet narrative systems.
