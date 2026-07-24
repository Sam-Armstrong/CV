\ProvidesClass{CV}[2026/06/25 Sam Armstrong CV]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% layout
\usepackage[hmargin=1.25cm, vmargin=0.55cm]{geometry}
\usepackage[UKenglish]{babel}
\usepackage{enumitem}
\usepackage{fontspec}
\usepackage{titlesec}
\usepackage{xcolor}
\usepackage[hidelinks]{hyperref}

% palette (matches sam-armstrong.github.io)
\definecolor{ink}{HTML}{1A1814}
\definecolor{muted}{HTML}{7A756D}
\definecolor{accent}{HTML}{C45C26}
\definecolor{rule}{HTML}{1A1814}

\hypersetup{
  colorlinks=true,
  linkcolor=accent,
  urlcolor=accent,
}

% fonts (Instrument Sans + DM Serif Display)
% static weight files: XeLaTeX does not reliably apply variable-font axes
\defaultfontfeatures{Ligatures=TeX}
\setmainfont{InstrumentSans-Regular.ttf}[
  Path=fonts/instrument-sans/,
  BoldFont=InstrumentSans-Bold.ttf,
  ItalicFont=InstrumentSans-Italic.ttf,
  BoldItalicFont=InstrumentSans-BoldItalic.ttf,
  Color=ink,
]

\newfontfamily\cvdisplay{DMSerifDisplay-Regular.ttf}[
  Path=fonts/dm-serif-display/,
  ItalicFont=DMSerifDisplay-Italic.ttf,
  Color=ink,
]

\newfontfamily\cvmedium{InstrumentSans-Medium.ttf}[
  Path=fonts/instrument-sans/,
  ItalicFont=InstrumentSans-MediumItalic.ttf,
  Color=ink,
]

\newfontfamily\cvsemibold{InstrumentSans-SemiBold.ttf}[
  Path=fonts/instrument-sans/,
  Color=ink,
]

% section title weight: swap the file below
%   InstrumentSans-SemiBold.ttf  (lighter)
%   InstrumentSans-Bold.ttf      (heavier)
\newfontfamily\cvbold{InstrumentSans-SemiBold.ttf}[
  Path=fonts/instrument-sans/,
  LetterSpace=1.5,
  Color=ink,
]

% global typography
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\pagestyle{empty}
\setlist[itemize]{leftmargin=*, nosep}

% minipages zero \parskip; keep columns explicit if we restore it later
\newenvironment{cvcolumn}[1]{%
  \begin{minipage}[t]{#1}%
}{%
  \end{minipage}%
}

% stacked short lines (degree title, etc.) — explicit space, not \parskip
\newcommand{\cvdetail}[1]{%
  \noindent #1\par\vspace{4pt}%
}

% header
\newcommand{\cvname}[1]{{%
  \cvdisplay\fontsize{24pt}{28pt}\selectfont #1%
}}

\newlength{\cvnameoffset}
\setlength{\cvnameoffset}{0pt}
\newsavebox{\cvnamebox}
\newsavebox{\cvcontactbox}

\newcommand{\cvcontactblock}[1]{%
  \begin{minipage}[t]{0.61\textwidth}
    \vspace*{0pt}%
    \raggedleft
    #1
  \end{minipage}%
}

\newcommand{\cvheader}[2]{%
  \sbox{\cvnamebox}{\cvname{#1}}%
  \sbox{\cvcontactbox}{\cvcontactblock{#2}}%
  \noindent
  \begin{minipage}[t]{0.34\textwidth}
    \vspace*{0pt}%
    \raisebox{\dimexpr-\height+\cvnameoffset\relax}{\usebox{\cvnamebox}}%
  \end{minipage}%
  \hfill
  \begin{minipage}[t]{0.61\textwidth}
    \vspace*{0pt}%
    \raisebox{-\height}{\usebox{\cvcontactbox}}%
  \end{minipage}%
  \par
}

\newcommand{\cvheadersep}{\vspace{8pt}}

\newcommand{\cvcontactlabel}[1]{{%
  \color{muted}\cvmedium\fontsize{10pt}{12pt}\selectfont #1%
}}

\newcommand{\contactlink}[1]{{\cvmedium\fontsize{10pt}{12pt}\selectfont\color{ink}#1}}

\newcommand{\cvcontactrow}[2]{\cvcontactlabel{#1} & \contactlink{#2} \\}

\newcommand{\cvcontacts}[1]{%
  \begin{tabular}{@{}r@{\hspace{6pt}}l@{}}#1\end{tabular}%
}

% sections
\titleformat{\section}
  {\cvbold\color{accent}\fontsize{9pt}{11pt}\selectfont}
  {}
  {0pt}
  {\MakeUppercase}
% before-skip is unreliable inside minipages; use \sectionsep between sections
\titlespacing*{\section}{0pt}{0pt}{1pt}

\newcommand{\sectionrule}{%
  \vspace{-3pt}%
  \noindent\rule{\linewidth}{0.4pt}%
  \vspace{3pt}%
}

\newcommand{\sectionsep}{\par\vspace{10pt}}

% entries
\newcommand{\datecolor}[1]{%
  \par\vspace{2pt}%
  {\color{muted}\cvmedium\itshape\fontsize{10pt}{12pt}\selectfont #1}%
  \par\vspace{6pt}%
}

\newcommand{\runsubsection}[1]{%
  {\cvmedium\color{ink}\fontsize{11pt}{13pt}\selectfont #1}%
  \par\vspace{4pt}%
}

\newenvironment{tightemize}{%
  \begin{itemize}[
    leftmargin=14pt,
    topsep=2pt,
    itemsep=1pt,
    parsep=0pt,
    partopsep=0pt,
    label=\textbullet,
  ]%
}{%
  \end{itemize}%
  \vspace{1pt}%
}

\newenvironment{tightemize*}{%
  \begin{itemize}[
    leftmargin=0pt,
    topsep=2pt,
    itemsep=3pt,
    parsep=0pt,
    partopsep=0pt,
    label={},
  ]%
}{%
  \end{itemize}%
  \vspace{1pt}%
}

\newcommand{\cvrefs}[1]{\vspace{6pt}{\small #1}}
