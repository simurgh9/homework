%% homework.cls  Copyright (C) 2020  Ahmad Tashfeen
%% This program comes with ABSOLUTELY NO WARRANTY.
%% This is free software, and you are welcome to redistribute it
%% under certain conditions; read file COPYING for more details.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2020/06/20 Homework]
\LoadClass[12pt,oneside]{amsart}

\RequirePackage[margin=0.5in]{geometry}
\RequirePackage{hwsymb, hwlst} % by Tashfeen, requires amsmath, amssymb, amsthm, amscd
\RequirePackage{lmodern, enumitem}
\RequirePackage{graphicx, wrapfig}
\RequirePackage[font=small]{caption} % for caption resizing with wrapfig
\RequirePackage[caption=false]{subfig}
\RequirePackage{pgffor} % for pictures and wrappings

% latex documentation: https://en.wikibooks.org/wiki/LaTeX
% em is the horizontal space unit and ex is the vertical

% bonus question environment
\theoremstyle{definition}
\newtheorem{bonus}{Bonus Question}
\newtheorem{innercustomthm}{Question}
\newenvironment{prb}[1] % for custom numbering
  {\renewcommand\theinnercustomthm{#1}\innercustomthm}
  {\endinnercustomthm}

% question environment
\newcounter{QuestionCounter}
\stepcounter{QuestionCounter}
\newenvironment{question}[1][\arabic{QuestionCounter}] {
  \vspace*{0.5\baselineskip}\noindent\textbf{Question #1. }\ignorespaces
  \ifnum#1=\value{QuestionCounter}
  \stepcounter{QuestionCounter}\ignorespaces
  \else\fi}{}


% for right aligned figure
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

% just one or a list of figures
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

% this handles the info tags at the beginning
\makeatletter
   % defining new variables
   \gdef\@class{\empty}
   \def\author#1{\gdef\@author{#1\\}}
   \def\class#1{\gdef\@class{#1\\}}
    \renewcommand{\maketitle} {
      \bgroup
        \setlength{\parindent}{0em}
          \begin{flushleft}
            \ifx\@author\empty \else \@author\fi
            \ifx\@class\empty \else \@class\fi
            \@date
          \end{flushleft}
      \egroup
      \begin{center}
        \textbf{\@title} \\
      \end{center}
      \bigskip
    }
\makeatother