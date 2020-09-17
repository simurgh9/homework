%% homework.cls  Copyright (C) 2020  Ahmad Tashfeen
%% This program comes with ABSOLUTELY NO WARRANTY.
%% This is free software, and you are welcome to
%% redistribute it under certain conditions; read
%% file COPYING for more details.

% Put in /usr/local/texlive/texmf-local/tex/latex/local
% And then re-index, see:
% tex.stackexchange.com/q/1137/215221

% Latex documentation: https://en.wikibooks.org/wiki/LaTeX
% 'em' is the horizontal space unit and 'ex' is the vertical

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2020/06/20 Homework]
\LoadClass[12pt,oneside]{amsart}

\RequirePackage[margin=0.5in]{geometry}
\RequirePackage{hwsymb, hwlst} % By Tashfeen
\RequirePackage{lmodern, enumitem}
\RequirePackage{graphicx, wrapfig}
\RequirePackage[font=small]{caption} % For caption resizing with wrapfig
\RequirePackage[caption=false]{subfig}
\RequirePackage{pgffor} % For pictures and wrappings
\RequirePackage{ifthen} % For if statements


% Bonus question environment
\theoremstyle{definition}
\newtheorem{bonus}{Bonus Question}

% DEPRECATED! Was for custom numbering
\newenvironment{prb}[1]
  {\renewcommand\theinnercustomthm{#1}\innercustomthm}
  {\endinnercustomthm}

% Question command
\newcounter{QuestionCounter}
\newcommand{\question}[1][\arabic{QuestionCounter}] {
  \def\@currentlabel{#1}
  \ifthenelse{\equal{#1}{\value{QuestionCounter}}}
  {\stepcounter{QuestionCounter}}{}
  \vspace*{0.5\baselineskip}
  \noindent\textbf{Question #1. }\ignorespaces
  }

% For right aligned figure
\newcommand{\rightfig}[4][0.4] {
  \begin{wrapfigure}{r}{#1\textwidth}
    \centering
    \vspace{-3ex}
    \includegraphics[width=#1\textwidth]{#2}
    \vspace{-3ex}
    \caption{#3}
    \vspace{-1ex}
    \label{#4} % has to stay after caption
  \end{wrapfigure}
}

% Just one or a list of figures
\newcommand{\fig}[4][0.4]{
  \begin{figure}[hbtp]
    \foreach \elem in {#2} {
      \begin{minipage}{#1\textwidth}\centering
        \subfloat {
          \includegraphics[width=\linewidth]{\elem}
        }
      \end{minipage} % minipage for easy centring
    }
    \caption{#3}\label{#4}
  \end{figure}
}

% This handles the info tags at the beginning
\makeatletter
  \gdef\@author{\empty}
  \gdef\@class{\empty}
  \newcommand{\class}[1]{\gdef\@class{#1}}
  \renewcommand{\author}[1]{\gdef\@author{#1}}
  \renewcommand{\maketitle} {\bgroup\setlength{\parindent}{0em}
    \begin{flushleft}
      \ifthenelse{\equal{\@author}{\empty}}{}{\@author\\}
      \ifthenelse{\equal{\@class}{\empty}}{}{\@class\\}
      \@date
    \end{flushleft}\egroup
    \begin{center}
      \textbf{\@title} \\
    \end{center}
    \bigskip
  }
\makeatother