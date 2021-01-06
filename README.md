<img src="./media/logo.png" width="450px" />

# Beautiful Homework in LaTeX

We provide,

1. `homework.cls`: A latex class extending the [AMS article](https://www.ctan.org/pkg/amsart) for better typset homwork. This class imports both `hwlst.sty` and `hwsymb.sty` for symbol shortcuts and code listings.
2. `hwlst.sty`: A collection of configurations and additions to the [Listings](https://www.ctan.org/pkg/listings) package.
3. `hwsymb.sty`: Defines a lot of useful shortcuts for bigger macros, e.g., `\Z` for `\mathbb{Z}`.
4. `hwjax.min.js`: A [MathJax v3](https://www.mathjax.org/) custom component that packs `'ams', 'newcommand', 'configmacros', 'action', 'require', 'autoload', 'hwsymb'` in one Javascript file.

## Getting Started

Here we talk about what we need to get a minimal example up and running. For more,

1. [Symbol shortcut table](./examples/mathjax/test.html)
2. [Documentation of the Latex class](./examples/latex/documentation.pdf)

### Prerequisites

If you want to use the Latex homework class (`homework.cls`) or one of the style packages (`*.sty`) then you'll need to have one of the distributions of Latex installed and a text editor, there are some good ones for editing `*.tex` files; I use Emacs with AucTeX. For the Latex distribution, I recommend [TeX Live](https://tug.org/texlive/).

If you just want to write Markdown or HTML files and want to use the symbols (with some macros and environments) defined by the AMS article packages then you only need the `hwjax.min.js` file.

### Examples

For Latex, get the homework class and style files and place them in the same directory as your latex document (`*.tex`). Here is a complete valid document.

```latex
\documentclass{homework}
\author{Musa Al`Khwarizmi}
\class{CS 3141: Prof. Kamil's Algorithm Analysis}
\date{\today}
\title{Minimal Complete Document}
\address{Bayt El-Hikmah}

\begin{document} \maketitle

\question Write down sets in order of containment.

We pretend that equivalence classes are just numbers.
\[
  \C \supset \R \supset \Q \supset \Z \supset \N \supset
  \P \supset (\GF[7] = \modulo[7])  \supset \{\nil\}
\]

\question Give an example element of $\O(n)$.

Take $11n \in \O(n)$.

\question Find roots of $x^2- 8x = 9$.

We proceed by factoring,
\begin{align*}
  x^2- 8x - 9         & = 9-9
    && \text{Subtract 9 on both sides.}         \\
  x^2- x + 9x - 9     & = 0
    && \text{Breaking the middle term.}         \\
  x(x - 1) + 9(x - 1) & = 0
    && \text{Pulling out common factors.}       \\
  (x - 1)(x + 9)      & = 0
    && \text{Pulling out common } (x - 1).      \\
  x                   & \in \{1, -9\}
    && f(x)g(x) = 0 \Ra f(x) = 0 \vee g(x) = 0. \\
\end{align*}

\question Show P $\?$ NP.

Let P be zero... Sorry.
\end{document}

```

For markup, you'll need the following script tag: `<script async src="path/to/hwjax.min.js"></script>`. Here is a complete example:

```html
<!DOCTYPE html>
<head>
  <title>Homework Mathjax Ext.</title>
  <script>MathJax = {chtml: { scale: 0.5 }, svg: { scale: 0.5 }}; </script>
  <script async src="path/to/hwjax.min.js"></script>
</head>
<body>
  <h1>Testing Mathjax Homework Extension</h1>
  
  Checking expanding macros:

  $$
    \floor{x}, \ceil{y}, \near{z}, \arr{x,y,z},
    \floor{\frac{x}{2}} < \frac{x}{2} < \ceil{\frac{x}{2}},
    \near{\frac{x}{2}},
    \arr{\frac{x}{2}, \frac{x}{3}, \frac{x}{4}},
    \paren{\frac{x}{2}, \frac{x}{3}, \frac{x}{4}},
    \brk{\frac{x}{2}, \frac{x}{3}, \frac{x}{4}},
    \curl{\frac{x}{2}, \frac{x}{3}, \frac{x}{4}},
    \abs{\frac{x}{2}}
  $$

  Lastly, checking an equation environment by finding roots to $ax^2+bx+c=0$. 

  \begin{align*}
    x^2- 8x - 9         & = 9-9
      && \text{Subtract 9 on both sides.}         \\
    x^2- x + 9x - 9     & = 0
      && \text{Breaking the middle term.}         \\
    x(x - 1) + 9(x - 1) & = 0
      && \text{Pulling out common factors.}       \\
    (x - 1)(x + 9)      & = 0
      && \text{Pulling out common } (x - 1).      \\
    x                   & \in \{1, -9\}
      && f(x)g(x) = 0 \Ra f(x) = 0 \vee g(x) = 0. \\
  \end{align*}                                      

  The checks here are by no means exhastive. Though the table above should check all the 
  <code>hwsymb.sty</code> symbols.
</body>
</html>
```

The latex document above produces the following pdf: [minimal.pdf](./examples/latex/minimal.pdf) and the html file above will look (not exactly but) close to [this](./examples/mathjax/test.html). You can find more example documents in the examples [folder](./examples/). Note that we also have some [Orgmode](https://orgmode.org/) examples, but those require some Emacs configurations in the init. file. I plan on sharing those in future.

## Built With

* [TeX Live](https://tug.org/texlive/) - My LaTeX distribution.
* [Mathjax](https://www.mathjax.org/) - A JavaScript display engine for mathematics that works in all browsers.
  - [Node and NPM](https://nodejs.org/en/) - The Javascript Engine and its package manager.

## Authors

* moi-même `¯\_( ͡❛ ͜ʖ ͡❛)_/¯`

## License

Copyright (C) 2020  Ahmad Tashfeen

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the [GNU General Public License](COPYING) along with this program.  If not, see <https://www.gnu.org/licenses/>.


## Acknowledgments

* [Paul Fili](https://math.okstate.edu/people/fili/): For showing me LaTeX and being one of *the* best teachers!
