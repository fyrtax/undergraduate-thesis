\ProvidesClass{sprawozdanie-agh} 
\ProcessOptions\LoadClass[12pt,a4paper,oneside]{article}
\usepackage[a4paper, top=20mm,right=20mm,bottom=20mm,left=20mm]{geometry}

% Pakiety
\RequirePackage[polish]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage[a4paper]{geometry}
\RequirePackage[usenames]{color}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\usepackage{ifthen}
\usepackage{float}
\usepackage{svg}
\svgsetup{inkscapelatex=false}
\usepackage{tikz}
\usepackage{soul}
\usepackage{amsmath}
\usepackage{caption}
\usepackage{setspace}

% ------
% https://alexwlchan.net/2017/latex-underlines/
\usepackage{contour}
\usepackage{ulem}

\renewcommand{\ULdepth}{1.8pt}
\contourlength{0.8pt}

\newcommand{\myuline}[1]{%
  \uline{\phantom{#1}}%
  \llap{\contour{white}{#1}}%
}
% ------

\usepackage{hyperref}

\hypersetup{
    colorlinks=true,
    linkcolor=black,
    filecolor=magenta,   
    urlcolor=blue,
    citecolor=violet
}

\usepackage{color}
\usepackage{datetime}

\frenchspacing % włączenie odpowiednich spacji po kropkach
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}

% Przepisanie parametrów
\def\przedmiot#1	{\gdef\@przedmiot{#1}}
\def\tytul#1		{\gdef\@tytul{#1}}
\def\podtytul#1		{\gdef\@podtytul{#1}}
\def\kierunek#1		{\gdef\@kierunek{#1}}
\def\autor#1		{\gdef\@autor{#1}}
\def\email#1		{\gdef\@email{#1}}
\def\data#1			{\gdef\@data{#1}}
\def\miasto#1		{\gdef\@miasto{#1}}
\def\rok#1		{\gdef\@rok{#1}}

% Domyślny kierunek
\ifx \@kierunek \undefined
	\def \@kierunek {brak kierunku}
\fi

\ifx \@data \undefined
	\def \@data {\today}
\fi

\ifx \@rok \undefined
	\def \@rok {}
\fi

\ifx \@miasto \undefined
	\def \@miasto {Kraków}
\fi

% Strona tytułowa
\newcommand{\stronatytulowa}{
	\begin{titlepage}
		\begin{center}
			%h\vspace*{3cm}
		
			% Góra strony
            \begin{spacing}{1.5}
			\textsc{\LARGE \bfseries Akademia Górniczo-Hutnicza\\im. Stanisława Staszica w Krakowie}\\[0.5cm]
            \end{spacing}
			\textsc{\large Wydział Geodezji Górniczej i Inżynierii Środowiska}\\
            \textsc{\large Kierunek \@kierunek}\\
			\textsc{\@rok}\\[1.5cm]
			\begin{figure}[h!]
				\begin{center}
					\leavevmode
                    \includesvg[scale=1]{logo_agh.svg}
				\end{center}
			\end{figure}
			\vspace{2cm}
			\textsc{\Large \@przedmiot}

			% Tytuł
			\HRule \\[0.4cm]{
				\huge \bfseries \@tytul\\[0.3cm]
				\large \@podtytul
			}\\[0.4cm]
			\HRule \\[1.5cm]
			
			% Autor
			\begin{minipage}{0.7\textwidth}
				\begin{center}
					\large
					%\emph{Autor:}\\
					\@autor
					\ifx \@email \undefined
					\else
						\space(\emph{\@email})
					\fi
				\end{center}
			\end{minipage}

            \begin{figure}[h!]
				\begin{center}
					\leavevmode
                    \includesvg[scale=0.5]{logo_wggiis_tekst.svg}
				\end{center}
			\end{figure}

			% Dół strony
			\vfill
			{\large \@miasto, \@data}
		\end{center}
	\end{titlepage}
	
	% Licznik strony
	\setcounter{page}{2}
}

\newcommand{\spistresci}{
    \tableofcontents
    \newpage

    \hypersetup{linkcolor=red}
}