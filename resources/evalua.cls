\def\fileversion{1.0}
\def\filedate{2023/06/05}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{evalua}[2023/01/20 Plantilla Evaluación RDS]
\LoadClass{exam}
\DeclareOption{addpoints}{\addpoints}
\DeclareOption{answers}{\printanswers}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax\ProcessOptions\relax
%%%% Random Choices  %%%%%%%%%%%%%%%%
%\RequirePackage[randomize,overload]{exam-randomizechoices}
%%%% Paquete colores %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{rdscolors}
%%%% Paquete idioma %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[spanish]{babel}
\renewcommand\spanishtablename{Tabla}
\arrayrulecolor{rdsdark!50}
%%%% Paquete texto %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{enumitem} % customize enumerate and item
\RequirePackage{mytcolorboxes,myboxes}
% \RequirePackage{exam-randomizechoices}
\RequirePackage{calc}
\RequirePackage{calculator}
\RequirePackage{xfrac,xlop,xparse,xpatch,xstring}
\RequirePackage{mathtools}
\ExplSyntaxOn
\cs_new_eq:NN \calc \fp_eval:n
\ExplSyntaxOff
\RequirePackage{cancel}
\RequirePackage{bohr,physics,chemfig}
\RequirePackage[version=4]{mhchem}
\RequirePackage{array}
\RequirePackage{afterpage}
\newcommand\blankpage{%
   \clearpage%
    \thispagestyle{empty}%
   % \addtocounter{page}{-1}%
     \null%
     \newpage%
     }
\RequirePackage{forest}
% \RequirePackage{ragged2e}
\renewcommand{\div}{\divisionsymbol}
\RequirePackage{longdivision}
\tikzset{>=latex} % for LaTeX arrow head
\@ifpackageloaded{lipsum}{}{\RequirePackage{lipsum}}
\@ifpackageloaded{tikz}{}{\RequirePackage{tikz}}
\usetikzlibrary{quotes,angles,graphs,chains,cd,fit,shadows,shadows.blur,shapes, patterns,calc, arrows,through}
\RequirePackage{tkz-euclide}
\RequirePackage{pgfplots}
\pgfplotsset{compat=newest}
\RequirePackage{lscape}
\input{insbox}
\RequirePackage{fontawesome5}
\RequirePackage{bbold}% se usa como \bbfamily [outlined]
\RequirePackage{comfortaa}% se usa en el nombre de la escuela \comfortaa [sand serif]
\RequirePackage{foekfont}% se usa en el numero de repaso \foekfamily [handwriting]
%\RequirePackage[rf]{electrum} %% lf option gives lining figures as default; 
%% remove option to get oldstyle figures as default
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\newcommand*\alterfont{\fontfamily{lmtt}\selectfont}%% se usa en la palabra guia \alterfont [typewriting]
\RequirePackage{shadowtext}
\shadowoffsetx{0.75pt}
\shadowoffsety{0.5pt}
\shadowrgb{0.3, 0.3, 0.3}
\RequirePackage[
    % showframe,
    letterpaper,
    includehead,
    left=20mm,
    right=20mm,
    top=5mm,
    bottom=25mm,
    headheight=10mm,% Set \headheight to 10mm
]{geometry} % Custom margins
\RequirePackage{anyfontsize}
\newcommand{\HUGE}{\fontsize{50}{60}}
\RequirePackage{graphicx}
\graphicspath{{../images}} %Setting the graphicspath
\RequirePackage[colorlinks = true,urlcolor=colorrds, linkcolor = colorrds]{hyperref}
\RequirePackage{caption,subcaption,capt-of}
\RequirePackage{float}
\RequirePackage{adjustbox}
\RequirePackage{wrapfig}
\RequirePackage{multicol}
\newcommand\R{\color{red}}
\newcommand\B{\color{blue}}
\newcommand\Y{\color{yellow}}
\RequirePackage{bookmark,booktabs}
%%%% MATH
\RequirePackage{amssymb,amsmath}
\decimalpoint
%%%% EXTERNAL SOURCES
\RequirePackage{newclude}
\RequirePackage{import}
\RequirePackage{subfiles} % Best loaded last in the preamble
\RequirePackage{titlesec}
\titleformat{\section}{\normalfont\fontsize{10}{5}\bfseries\color{gray}}{}{0pt}{}
\titlespacing*{\section}{0pt}{0em}{0.3em}
\titleformat{\subsection}
{\normalfont\fontsize{10}{5}\bfseries\color{lightgray}}{\thesubsection}{0.5em}{}
\titlespacing*{\subsection}{0pt}{0.5em}{0.3em}
\renewcommand{\arraystretch}{1.4}
\AtBeginEnvironment{choices}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{choices}{\vspace{0.1\baselineskip}}
%\AtBeginEnvironment{oneparchoices}{\vspace{0.3\baselineskip}}
%\AtEndEnvironment{oneparchoices}{\vspace{-0.8\baselineskip}}
\AtBeginEnvironment{checkboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{checkboxes}{\vspace{0.1\baselineskip}}
\AtBeginEnvironment{oneparcheckboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{oneparcheckboxes}{\vspace{0.1\baselineskip}}
\newcommand\comillas[1]{``#1''}
\newcommand{\midmatch}{\hspace{0.75in}\underline{\hspace{0.5in}     }}
\newcommand{\tf}[1][{}]{%
    \fillin[#1][1cm]%
}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{%
        \node[shape=circle, draw, fill=Goldenrod!10, minimum size=1.8em, inner sep=0pt, thick] (char) {#1};}}

\renewcommand\choicelabel{{\color{DarkOliveGreen}\bfseries\thechoice}.}
% \qformat{\color{BrickRed}\circled{\thequestion}}
\renewcommand\questionlabel{\color{BrickRed!65!black}\circled{\thequestion}}
\renewcommand{\thepartno}{\alph{partno}}
\renewcommand{\partlabel}{\color{SubjectColor}\normalsize\circled{{{\color{BrickRed!65!black}\thequestion}\thepartno}}}
\renewcommand{\solutiontitle}{\noindent\textbf{Soluci\'on:}\par\noindent}
\checkboxchar{\faIcon[regular]{square}}
\CorrectChoiceEmphasis{\color{red!50!gray}\bf}
\checkedchar{\faIcon[regular]{check-square}}
% \pointsinmargin
%\pointformat{}
\pointformat{\color{SubjectColor}{\scalebox{0.6}[1.0]{[\hspace*{0.3em}\sffamily\rule[-1mm]{3mm}{0.2pt} de \thepoints]}}}
\pointpoints{pt}{pts}

%%%%%%%%%% Document Info %%%%%%%%%%%%%%%%%
%%%% INPUTS
\newcommand{\themateria}{1}
\newcommand{\materia}[1]{\renewcommand{\themateria}{#1}}
\newcommand{\thegrado}{1}
\newcommand{\grado}[1]{\renewcommand{\thegrado}{#1}}
\newcommand{\theguia}{1}
\newcommand{\guia}[1]{\renewcommand{\theguia}{#1}}
\newcommand{\thecicloescolar}{1}
\newcommand{\cicloescolar}[1]{\renewcommand{\thecicloescolar}{#1}}
\newcommand{\theunidad}{1}
\newcommand{\unidad}[1]{\renewcommand{\theunidad}{#1}}
\newcommand{\theaprendizajes}{1}
\newcommand{\aprendizajes}[1]{\renewcommand{\theaprendizajes}{
        \begin{itemize}[leftmargin=*,label=\small\color{colorrds}\faIcon{user-graduate}]%
            #1%
        \end{itemize}%
    }}
\newcommand{\thereglas}{1}
\newcommand{\reglas}[1]{\renewcommand{\thereglas}{%
        \small Al comenzar este examen, aceptas las siguientes reglas:
        \begin{itemize}[topsep=1pt, partopsep=0pt,itemsep=1pt,parsep=0pt,label=\color{red!70!black}\faTimes]%
            #1
        \end{itemize}
        Si no consideraste alguna de estas reglas,
        comunícalo a tu profesor.
    }}
\reglas{
    \item No se permite \textbf{salir} del sal\'on de clases. %\faToiletPaperSlash
    \item No se permite \textbf{intercambiar o prestar} ningún tipo de material.
    \item No se permite el uso de \textbf{celular} o cualquier \textbf{otro dispositivo}.
    \item No se permite el uso de \textbf{apuntes}, \textbf{libros}, notas o formularios.
    \item No se permite \textbf{mirar} el examen de otros alumnos.
    \item No se permite la \textbf{comunicaci\'on} oral o escrita con otros alumnos.
}
\newcommand\thecontrol[1][yshift=-4cm,xshift=-0.55\textwidth]{%
    \ifprintanswers%
        {\begin{tikzpicture}[remember picture, overlay,shift=(current page.north east)]%
            \node[#1]{\autocontrol{\color{red}\alterfont\shadowtext{Soluciones propuestas}}};
        \end{tikzpicture}}%
    \else{}%
    \fi%
}
%%%% COMMAND
\newcommand\fracquestion[2]{%
    \begin{minipage}[c][][t]{0.8cm}\begin{solutionbox}{1.3cm}\large\fillin[#1][0in]\end{solutionbox} \end{minipage}\hfill\begin{minipage}[c][][t]{0.7\linewidth} #2 \end{minipage}%
}
\newcommand\quadraticseries[3]{%
    \def\diff{\calc{#2-#1}}%
    \def\siff{\calc{#3-#2}}%
    \def\const{\calc{\siff-\diff}}%
    \def\fiff{\calc{\siff+\const}}%
    \def\giff{\calc{\fiff+\const}}%
    \def\hiff{\calc{\giff+\const}}%
    \[ \lefteqn{\underbrace{\phantom{{#1},{#2}}}_{\diff}}{#1}, \overbrace{{#2},\lefteqn{\color{red}\underbrace{\phantom{{#3},\calc{#3+\fiff}}}_{\fiff}}{#3}}^{\siff}, \color{red}\overbrace{\calc{#3+\fiff},\lefteqn{\underbrace{\phantom{\calc{#3+\fiff}, \calc{#3+\fiff+\giff}}}_{\hiff}}\calc{#3+\fiff+\giff}}^{\giff}, \calc{#3+\fiff+\giff+\hiff}\]
}
\tikzset{
    instructionbox/.style={%dashed,
            draw=colorrds,fill=white, rectangle,
            inner sep=10pt, style=rounded corners,
            %drop shadow={fill=black, opacity=1}
            blur shadow={
                    shadow opacity=40,
                    shadow yshift=-1mm,
                    shadow xshift=-1mm,
                    %shadow blur steps=30,
                    %shadow blur extra rounding=5pt
                }
        },
    instructiontitle/.style={
            fill=white,
            style=rounded corners},
    gradesbox/.style={anchor=north east,xshift=-.21\textwidth-1pt,
            yshift=-2cm,
            draw=none,%=colorrds, dashed,
            fill=white, rectangle,
            inner sep=5pt, style=rounded corners,
            %drop  shadow={fill=lightgray, opacity=0.7}
        },
    gradetableboxtitle/.style={
            fill=white,
            inner xsep=2pt,inner ysep=2pt,
            style=rounded corners,
            % drop shadow,
        },
    objetivobox/.style={
            anchor=north,
            xshift=-.86\textwidth,
            draw=colorrds, dashed,fill=white, rectangle,
            inner sep=10pt, style=rounded corners,
            %drop  shadow={fill=lightgray, opacity=0.7}
        },
    objetivotitle/.style={ fill=white,
            style=rounded corners,
            % drop shadow,
        }
}
\newcommand{\objetivobox}[3][fill=white]{%
    \begin{tikzpicture}
        \node[objetivobox,#1] (box)
        {%
            \adjustbox{minipage=.95\linewidth}{%
                \normalfont #3
            }%
        };
        \node[objetivotitle,right=10pt,yshift=2pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} #2};
    \end{tikzpicture}%
}
\newcommand{\gradesbox}[2][fill=white]{%
    \begin{tikzpicture}%
        \node[gradesbox, #1] (box) {%
        \cellwidth{0.5em}\hqword{Pregunta}\hpgword{Página}\hpword{Puntos}\hsword{Obtenidos}\htword{Total}\vqword{Pregunta}\vpgword{P\'gina}\vpword{Puntos}\vsword{Ganados}\vtword{Total}%
        \arrayrulecolor{colorrds!30}%
        \ifnum\numquestions>7%
            {
            \ifnum\numquestions>15%
                {\ifthenelse{\isodd{\numquestions}}{\multicolumngradetable{2}[questions]}{\multicolumngradetable{2}[questions]}}
                \else%
                {\multirowgradetable{2}[questions]}%\ifthenelse{\isodd{\numquestions}}{\multirowgradetable{2}[questions]}{\multicolumngradetable{2}[questions]}}
            \fi%
            }%
            \else{\gradetable[h][questions]}%
        \fi%
        %}%
        };
        \node[gradetableboxtitle,xshift=-200pt,yshift=4pt] at (box.north east) {\bfseries \LARGE \comfortaa \color{Sepia} #2};
    \end{tikzpicture}%
}
\newcommand{\instructionbox}[3][fill=white]{%
    \begin{tikzpicture}%
        \node [instructionbox, #1] (box)
        {%
            \adjustbox{minipage=.98\linewidth}{%
                \normalfont #3
            }%
        };
        \node[instructiontitle, right=10pt] at (box.north west) {\bfseries \comfortaa \color{Sepia} #2};
    \end{tikzpicture}%
}

%%%% LOGO
\def\LOGO{%
    \begin{picture}(0,0)\unitlength=1cm
        \put (3,-1.5) {\includegraphics[width=2.2cm]{logo.png}}
    \end{picture}
}
\makeatletter
\let\latexl@section\l@section
\def\l@section#1#2{\begingroup\let\numberline\@gobble\latexl@section{#1}{#2}\endgroup}
\let\latexl@subsection\l@subsection
\def\l@subsection#1#2{\begingroup\let\numberline\@gobble\latexl@subsection{#1}{#2}\endgroup}
\let\latexl@subsubsection\l@subsubsection
\def\l@subsubsection#1#2{\begingroup\let\numberline\@gobble\latexl@subsubsection{#1}{#2}\endgroup}
\AtBeginDocument{
\setlength{\columnsep}{10pt}
\setlength\linefillheight{.2in}
% \setlength{\columnseprule}{5pt}
\setlength{\parindent}{0pt}
\addpoints
\pagestyle{headandfoot}
\extraheadheight[2cm]{0.5cm}
\firstpageheader{}{
{\LARGE\color{colorrds}  Escuela Rafael D\'iaz Serd\'an}\LOGO\\
{\bfseries\large\color{MainColor}\thegrado \ (\thecicloescolar)}\\
{\bfseries\large\color{SubjectColor}\themateria} \\
{\@title \ \theunidad}\\
{\small \@author}
\thecontrol[yshift=-4cm,xshift=-0.6\textwidth,scale=1.5]
}{}
\firstpagefooter{}{
    \color{colorrds}\thepage \ de \numpages
}{}
\ifprintanswers
    \runningheader{\color{SubjectColor}\themateria}{\@title \ \theunidad {\thecontrol[yshift=-1.7cm,xshift=-0.8\textwidth]}}{\hfill\color{MainColor}\thegrado \ (\thecicloescolar)}
\else
    \runningheader{\color{SubjectColor}\themateria}{\@title \ \theunidad }{\hfill\color{MainColor}\thegrado \ (\thecicloescolar)}
\fi
\runningfooter{}{  \color{colorrds}\thepage \ de \numpages}{}
\runningheadrule

\vspace{0.2cm}

\begin{minipage}{\textwidth}
    \makebox[0.73\linewidth]{\textbf{\comfortaa \color{Sepia} Nombre del alumno: } \DrawLine[9cm]}
    \makebox[0.25\linewidth]{\textbf{ \comfortaa \color{Sepia} Fecha: } \ \DrawLine[3.6cm]}
\end{minipage}
\vspace*{0.1cm}

\begin{minipage}{\textwidth}
    \makebox[\linewidth]{\textbf{\comfortaa \color{Sepia} Evaluador: } \DrawLine[15.5cm]}
\end{minipage}

\vspace{0.2cm}

\begin{minipage}{\textwidth}
    \hspace{0.1cm}\begin{minipage}[t][][b]{.33\textwidth}
        \instructionbox{Instrucciones:}{%\large%
            Lee con atenci\'on cada pregunta y realiza lo que se te pide.
            Desarrolla tus respuestas en el espacio determinado para cada solución.
            De ser necesario, utiliza una hoja en blanco por separado, anotando en ella tu nombre
            completo, el n\'umero del problema y la soluci\'on propuesta.
        }%
    \end{minipage}\hspace{0.9cm}%
    \begin{minipage}[t][][b]{.58\textwidth}
        \instructionbox{Reglas:}{%
            \thereglas
        }
    \end{minipage}
\end{minipage}

\vspace{0.2cm}

\begin{minipage}{\textwidth}
    \begin{minipage}[t][][b]{.55\textwidth}
        \objetivobox{Aprendizajes a evaluar:}{%\small%
            \theaprendizajes
        }
    \end{minipage}\hfill%
    \begin{minipage}[t][][b]{.4\textwidth}
        \adjustbox{
            min size={0.05\textwidth}{50pt},
            max size={0.9\textwidth+3pt}{400pt}
            }{%
            \gradesbox{Calificación:}%
            }%
    \end{minipage}
\end{minipage}%
}
\makeatother