%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Deckblatt}
\LoadClass[a4paper,
ngerman,
openright,
12pt]
{scrreprt}

\newif\ifinDraftThesis
\DeclareOption{DraftThesis}{\global\inDraftThesistrue}
\DeclareOption{FinalThesis}{\global\inDraftThesisfalse}
\ExecuteOptions{DraftThesis}
\ProcessOptions\relax
\ifinDraftThesis
  \RequirePackage[left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm]{geometry}
\else
  \RequirePackage[left=3.0cm,right=2.0cm,top=2.5cm,bottom=2.5cm]{geometry}
\fi

\RequirePackage{multicol}
\RequirePackage{sectsty}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\linespread {1.25}
\RequirePackage{mathptmx}
\RequirePackage{calc}
\RequirePackage{url}
\RequirePackage[ngerman]{babel}
\RequirePackage[pdftex]{graphicx}
\usepackage{pdfpages}
\usepackage{blindtext}
\usepackage{makeidx}
\usepackage{multirow}

\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{caption}
\usepackage{tikz}
\usepackage{pgfplots}
\usepackage{forest}
\usepackage{bm}
\usepackage{algorithm}
\usepackage{listings}
\usepackage{lipsum}
\usepackage{csvsimple}
\usepackage[noend]{algpseudocode}

\usepackage[ngerman]{varioref} % 1.
\usepackage{hyperref}% 2.
\usepackage[ngerman]{cleveref}% 3.

\usepackage[babel, german=quotes]{csquotes}
\usepackage[authordate,backend=biber]{biblatex-chicago}

\RequirePackage{supertabular}
\RequirePackage{tabularx}
\widowpenalty=10000
\clubpenalty=10000

\renewcommand\section{\newpage \@startsection {section}{1}{\z@}%
                                              {-3.5ex \@plus -1ex \@minus -.2ex}%
                                              {2.3ex \@plus.2ex}%
                                              {\normalfont\Large\bfseries}}
%\chapterfont{\thinspace}
\renewcommand*{\chapterformat}{\thechapter\hspace{0.6cm}}
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
\sectionfont{\fontsize{16pt}{18pt}\selectfont}
\subsectionfont{\fontsize{12pt}{14pt}\selectfont\em}
\subsubsectionfont{\fontsize{12pt}{14pt}\selectfont\em}
\newcommand{\nosection}[1]{\section*{\fontsize{14pt}{16pt}\selectfont\bf #1}}
\newcommand{\schule}[1]{#1}
\usepackage{abstract}
\let\cleardoublepage\clearpage

\tablefirsthead{}
\tablelasttail{}

\renewcommand{\contentsname}{\fontsize{14pt}{16pt}\selectfont\bf Table of Contents:}

\setlength{\parindent}{0mm}
\setlength{\parskip}{8pt}

% Page number
\usepackage{scrlayer-scrpage}
\rofoot*{\pagemark}
\cofoot*{}
\pagestyle{scrheadings}

\pagestyle{empty}

\def\myDate#1{\gdef\@myDate{#1}}
\def\subtitle#1{\gdef\@subtitle{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\schule#1{\gdef\@schule{#1}}
\def\klasse#1{\gdef\@klasse{#1}}
\def\schuljahr#1{\gdef\@schuljahr{#1}}
\def\schullogo#1{\gdef\@schullogo{#1}}
\renewcommand{\maketitle}{
\thispagestyle{empty}
  \begin{center}
  	\@schule
  \end{center}
  \begin{center}
      \bfseries\huge\uppercase\expandafter{\@title}     
  \end{center}
  \vskip0.25in
  \begin{center}
      \begin{minipage}[c]{10cm}
          \begin{center}
          \bfseries\large\expandafter{\@subtitle} 
          \end{center}
      \end{minipage}
  \end{center}    
  \vfill
  \begin{center}
      Vorwissenschaftliche Arbeit verfasst von\\
      \Large \name \\
      \normalsize Klasse \@klasse \\
  \end{center}
  \vfill
  \begin{center}
  	\includegraphics[]{\@schullogo}
  \end{center}
 \begin{tabular}{ll}
	\ifthenelse{\boolean{betreuerFemale}}{Betreuerin}{Betreuer}: & \@supervisor \\
	\multicolumn{2}{l}\@schuljahr \\
	Eingereicht am \@submitdate \\
\end{tabular}
}
