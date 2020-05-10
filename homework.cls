%% homework.cls  Copyright (C) 2020  Ahmad Tashfeen
%% This program comes with ABSOLUTELY NO WARRANTY.
%% This is free software, and you are welcome to redistribute it
%% under certain conditions; read file COPYING for more details.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2020/05/10 Homework]
\LoadClass[12pt,oneside]{amsart}

\RequirePackage[margin=0.5in]{geometry}
\RequirePackage{amsmath,amsthm,amssymb,amscd}
\RequirePackage{listings, xcolor, lmodern, enumitem}
\RequirePackage{graphicx, wrapfig}
\RequirePackage[font=small]{caption} % for caption resizing with wrapfig
\RequirePackage[caption=false]{subfig}
\RequirePackage{pgffor} % for pictures and wrappings

% latex documentation: https://en.wikibooks.org/wiki/LaTeX
% em is the horizontal space unit and ex is the vertical

% new environments 
\theoremstyle{definition}
\newtheorem{bonus}{Bonus Question}
\newtheorem{innercustomthm}{Question}
\newenvironment{prb}[1] % for custom numbering
	{\renewcommand\theinnercustomthm{#1}\innercustomthm}
	{\endinnercustomthm}

\newcounter{QuestionCounter}
\stepcounter{QuestionCounter}
\newenvironment{question}[1][\arabic{QuestionCounter}] {
  \noindent\textbf{Question #1. }\ignorespaces
  \ifnum#1=\value{QuestionCounter}
  \stepcounter{QuestionCounter}\ignorespaces
  \else\fi}{}
    
% new and renewed commands
\DeclareRobustCommand{\bold}[1]{\textbf{#1}}    
\DeclareRobustCommand{\italic}[1]{\textit{#1}}    
\renewcommand\qedsymbol{$QED.$}
\renewcommand\labelenumi{\theenumi)} % to make (n) into n)
\newcommand{\bC}{\mathbb{C}}
\newcommand{\bN}{\mathbb{N}}
\newcommand{\bZ}{\mathbb{Z}}
\newcommand{\bQ}{\mathbb{Q}}
\newcommand{\bR}{\mathbb{R}}
\newcommand{\ra}{\rightarrow}
\newcommand{\Ra}{\Rightarrow}
\newcommand{\al}{\alpha}
\newcommand{\ep}{\varepsilon}
\newcommand{\p}{\partial}
\newcommand{\injective}{\hookrightarrow}
\newcommand{\surjective}{\twoheadrightarrow}
\newcommand{\bijective}{\hookrightarrow\mathrel{\mspace{-15mu}}\rightarrow}
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

% code block beautification
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{codeyellow}{rgb}{0.51, 0.37, 0.012}
\lstset {
    commentstyle=\color{codegreen},
    keywordstyle=\bfseries\color{codeyellow},
    numberstyle=\ttfamily\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=2
}