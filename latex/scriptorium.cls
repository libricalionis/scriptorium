% ==============================================================================
% Scriptorium
% ------------------------------------------------------------------------------
% Minimal literary class for LaTeX memoir.
% Designed for atmospheric fiction, serialized narratives,
% pericopes, and book-like typography.
%
% Author: Calion
% License: MIT License
% Repository: https://github.com/libricalionis/scriptorium
%
% Copyright (c) 2026 Calion
%
% Permission is hereby granted, free of charge, to any person obtaining
% a copy of this software and associated documentation files (the "Software"),
% to deal in the Software without restriction, including without limitation
% the rights to use, copy, modify, merge, publish, distribute, sublicense,
% and/or sell copies of the Software, and to permit persons to whom the
% Software is furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included
% in all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
% OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
% THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
% FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
% DEALINGS IN THE SOFTWARE.
% ==============================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scriptorium}[2026/05/15 Minimal literary memoir class]

% ==============================================================================
% Options
% ==============================================================================

\newif\ifscriptoriumpocket
\scriptoriumpocketfalse

\newif\ifscriptoriumcolor
\scriptoriumcolortrue

\newif\ifscriptoriumcolorforced
\scriptoriumcolorforcedfalse

\newif\ifscenepagebreak
\scenepagebreakfalse

\def\scriptorium@lang{french}
\def\scriptorium@classoptions{11pt,twoside,openright,final}

% Edition format
\DeclareOption{pocket}{%
  \scriptoriumpockettrue
  \def\scriptorium@classoptions{10pt,twoside,openright,final}%
}

\DeclareOption{hardcover}{%
  \scriptoriumpocketfalse
  \def\scriptorium@classoptions{11pt,twoside,openright,final}%
}

% Language
\DeclareOption{french}{\def\scriptorium@lang{french}}
\DeclareOption{english}{\def\scriptorium@lang{english}}

% Colors
\DeclareOption{color}{%
  \scriptoriumcolortrue
  \scriptoriumcolorforcedtrue
}

\DeclareOption{nocolor}{%
  \scriptoriumcolorfalse
  \scriptoriumcolorforcedtrue
}

% Scene handling
\DeclareOption{scenepagebreak}{\scenepagebreaktrue}
\DeclareOption{noscenepagebreak}{\scenepagebreakfalse}

% Unknown options are passed to memoir
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ProcessOptions\relax

% Default color behavior depending on edition
\ifscriptoriumcolorforced\else
  \ifscriptoriumpocket
    \scriptoriumcolorfalse
  \else
    \scriptoriumcolortrue
  \fi
\fi

% ==============================================================================
% Base class
% ==============================================================================

\LoadClass[\scriptorium@classoptions]{memoir}

% ==============================================================================
% Core packages
% ==============================================================================

\RequirePackage{iftex}
\RequirePackage{etoolbox}
\RequirePackage{silence}
\RequirePackage{needspace}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{lettrine}
\RequirePackage{hyperref}

% Suppress harmless babel-related warning
\WarningFilter{latex}{Command \showhyphens has changed.}

% ==============================================================================
% Language and typography
% ==============================================================================

\ifPDFTeX
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \RequirePackage[\scriptorium@lang]{babel}
  \RequirePackage{libertinus}
  \RequirePackage{microtype}
\else
  \RequirePackage{fontspec}
  \RequirePackage[\scriptorium@lang]{babel}
  \RequirePackage{microtype}
  \setmainfont[Ligatures=Historic]{Libertinus Serif}
\fi

\RequirePackage{csquotes}

% ==============================================================================
% Colors
% ==============================================================================

\ifscriptoriumcolor
  \definecolor{solis}{RGB}{198,158,74}
  \definecolor{sanguis}{RGB}{160,54,60}
  \definecolor{nebula}{RGB}{86,150,182}
\else
  \definecolor{solis}{gray}{0.45}
  \definecolor{sanguis}{gray}{0.25}
  \definecolor{nebula}{gray}{0.55}
\fi

% ==============================================================================
% Book format
% ==============================================================================

\ifscriptoriumpocket
  % Pocket edition: 5.25 x 8 in
  \setstocksize{8in}{5.25in}
  \settrimmedsize{8in}{5.25in}{*}
  \setlrmarginsandblock{0.7in}{0.55in}{*}
  \setulmarginsandblock{0.7in}{0.75in}{*}
  \settypeblocksize{6.55in}{4in}{*}
\else
  % Hardcover edition: 6 x 9 in
  \setstocksize{9in}{6in}
  \settrimmedsize{9in}{6in}{*}
  \setlrmarginsandblock{0.9in}{0.6in}{*}
  \setulmarginsandblock{0.75in}{0.95in}{*}
  \settypeblocksize{7.3in}{4.5in}{*}
\fi

\checkandfixthelayout

% ==============================================================================
% Paragraph rhythm
% ==============================================================================

\setlength{\parindent}{1.2em}
\setlength{\parskip}{0pt}
\linespread{1.05}

% ==============================================================================
% Drop caps
% ==============================================================================

\renewcommand{\LettrineFontHook}{\normalfont\color{sanguis}}
\setlength{\DefaultNindent}{0em}
\setlength{\DefaultFindent}{0.2em}

% ==============================================================================
% Chapter style
% ==============================================================================

\makechapterstyle{scriptorium}{
  \renewcommand{\chapnamefont}{\Large\scshape}
  \renewcommand{\chapnumfont}{\Large\scshape}
  \renewcommand{\chaptitlefont}{\Huge\bfseries\color{sanguis}}
  \renewcommand{\printchaptername}{\chapnamefont \chaptername}
  \renewcommand{\printchapternum}{\chapnumfont\space \thechapter}
  \renewcommand{\afterchapternum}{\par\vspace{1.5cm}}
  \renewcommand{\printchaptertitle}[1]{%
    \begin{center}
      \chaptitlefont ##1
    \end{center}
  }
}

\chapterstyle{scriptorium}

% ==============================================================================
% Part title style
% ==============================================================================

\renewcommand{\printpartname}{}
\renewcommand{\printpartnum}{}
\renewcommand{\printparttitle}[1]{%
  \thispagestyle{empty}%
  \null\vfill
  \begin{center}
    {\Large\scshape\color{sanguis}\thepart\par}
    \vspace{1.5cm}
    {\huge ##1\par}
  \end{center}
  \vfill\null
  \clearpage
}

% ==============================================================================
% Scene management
% ==============================================================================

\setsecheadstyle{\centering\large\scshape\color{sanguis}}
\setbeforesecskip{1.2em}
\setaftersecskip{0.6em}

\let\scriptorium@oldsection\section

\renewcommand{\section}[1]{%
  \ifscenepagebreak
    \clearpage
  \else
    \par
    \needspace{2\baselineskip}%
  \fi
  \scriptorium@oldsection*{#1}%
  \addcontentsline{toc}{section}{#1}%
  %\noindent
}

\newcommand{\scenebreak}
{
  \par\vspace{0.0em}
  \begin{center}
    \noindent{\color{solis}\rule{0.5\textwidth}{1pt}\par}
  \end{center}
  \vspace{0.3em}\par
}

% ==============================================================================
% Narrative commands
% ==============================================================================

\newcommand{\figura}[1]{%
  \textsc{\color{sanguis}#1}%
}

% Generic narrative note
\newcommand{\scriptoriumnote}[1]{%
  \par
  \needspace{\baselineskip}
  \vspace{0.8em}
  \begingroup
    \leftskip=2.5em
    \rightskip=2.5em
    \parindent=0pt
    \itshape
    #1\par
  \endgroup
  \vspace{0.8em}
}

% Signed Calion note
\newcommand{\calionnote}[1]{%
  \par
  \needspace{\baselineskip}
  \vspace{0.8em}
  \begingroup
    \leftskip=2.5em
    \rightskip=2.5em
    \parindent=0pt
    \itshape
    #1\par
    \vspace{0.5em}
    \hfill\textup{\figura{Calion}}\par
  \endgroup
  \vspace{0.8em}
}

% Indented quotation / message / archival fragment
\newcommand{\scriptoriumquote}[1]{%
  \par
  \needspace{\baselineskip}
  \vspace{0.8em}
  \begingroup
    \color{sanguis}
    \leftskip=2.5em
    \rightskip=2.5em
    \parindent=0pt
    \itshape
    #1\par
  \endgroup
  \vspace{0.8em}
}

% SMS — speaker A
\newcommand{\smsa}[1]{%
  \par
  \needspace{\baselineskip}
  \vspace{0.8em}
  \begingroup
    \color{sanguis}
    \leftskip=2.5em
    \rightskip=2.5em
    \parindent=0pt
    \itshape
    #1\par
  \endgroup
  \vspace{0.8em}
}

% SMS — speaker B
\newcommand{\smsb}[1]{%
  \par
  \needspace{\baselineskip}
  \vspace{0.8em}
  \begingroup
    \color{sanguis}
    \leftskip=5em
    \rightskip=0em
    \parindent=0pt
    \itshape
    #1\par
  \endgroup
  \vspace{0.8em}
}

% Final marker
\newcommand{\theend}
{
  \vspace{2em}

  \begin{center}
    {\large\scshape\color{sanguis}
      \ifdefstring{\scriptorium@lang}{french}
        {Fin}
        {The End}
    }
  \end{center}
}

% ==============================================================================
% Final setup
% ==============================================================================

\AtEndPreamble{%
  \ifscriptoriumcolor
    \hypersetup{
      colorlinks=true,
      linkcolor=sanguis,
      urlcolor=nebula,
      citecolor=solis
    }%
  \else
    \hypersetup{hidelinks}%
  \fi

  \clubpenalty=10000
  \widowpenalty=10000
  \displaywidowpenalty=10000

  \flushbottom
  \pagestyle{plain}
}

% ==============================================================================
% Public metadata
% ==============================================================================

\newcommand{\scriptoriumstyle}{Scriptorium}

% ==============================================================================
% Title page metadata
% ==============================================================================

\newcommand{\scriptorium@title}{}
\newcommand{\scriptorium@author}{Calion}
\newcommand{\scriptorium@year}{}
\newcommand{\scriptorium@website}{libricalionis.com}
\newcommand{\scriptorium@email}{libri.calionis@gmail.com}
\newcommand{\scriptorium@copyright}{}

\newcommand{\scriptorium@titleimagecolor}{}
\newcommand{\scriptorium@titleimagegrayscale}{}

\renewcommand{\title}[1]{\renewcommand{\scriptorium@title}{#1}}
\renewcommand{\author}[1]{\renewcommand{\scriptorium@author}{#1}}
\newcommand{\publicationyear}[1]{\renewcommand{\scriptorium@year}{#1}}
\newcommand{\website}[1]{\renewcommand{\scriptorium@website}{#1}}
\newcommand{\contactemail}[1]{\renewcommand{\scriptorium@email}{#1}}
\newcommand{\copyrightnotice}[1]{\renewcommand{\scriptorium@copyright}{#1}}
\newcommand{\titleimagecolor}[1]{\renewcommand{\scriptorium@titleimagecolor}{#1}}
\newcommand{\titleimagegrayscale}[1]{\renewcommand{\scriptorium@titleimagegrayscale}{#1}}

% ==============================================================================
% Title pages
% ==============================================================================

\renewcommand{\maketitle}{%
  \frontmatter

  % Title page
  \thispagestyle{empty}
  \null\vfill
  \begin{center}
    {\Huge\bfseries\color{sanguis}\textsc{\scriptorium@title}\par}
    \vspace{0.8cm}
    {\Large\textsc{\scriptorium@author}\par}
    \vspace{1.5cm}

  \ifscriptoriumcolor
    \ifdefempty{\scriptorium@titleimagecolor}
      {}
      {%
        \includegraphics[
          width=0.55\textwidth
        ]{\scriptorium@titleimagecolor}%
      }
  \else
    \ifdefempty{\scriptorium@titleimagegrayscale}
      {}
      {%
        \includegraphics[
          width=0.55\textwidth
        ]{\scriptorium@titleimagegrayscale}%
      }
  \fi

  \end{center}
  \vfill\null
  \clearpage

  % Liminary page
  \thispagestyle{empty}
  \null\vfill
  \begin{center}
    \footnotesize

    \ifdefempty{\scriptorium@year}
    {}
    {%
      \ifdefstring{\scriptorium@lang}{french}
        {Ce livre a été rédigé en \scriptorium@year.\par}
        {This book was written in \scriptorium@year.\par}
      \vspace{0.5em}
    }

    \ifdefstring{\scriptorium@lang}{french}
      {Publié en feuilleton sur}
      {Published as a serial on}
    \ \texttt{\color{nebula}\scriptorium@website}\par

    \vspace{0.5em}

    \ifdefempty{\scriptorium@copyright}
    {%
      \textcopyright\ \scriptorium@year\
      \scriptorium@author\ / LibriCalionis\par
    }
    {%
      \scriptorium@copyright\par
    }

    \vspace{0.5em}

    \ifdefstring{\scriptorium@lang}{french}
      {Pour toute correspondance :}
      {Correspondence:}
    \ \texttt{\color{nebula}\scriptorium@email}

  \end{center}
  \clearpage
}
