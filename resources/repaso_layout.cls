\def\fileversion{2.0}
\def\filedate{2026/08/02}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{repaso_layout}[\filedate\space Plantilla Repaso RDS Version \fileversion\space by J.Melchor]
% Create a toggle flag for a custom draft layout
\newif\if@draft
\newif\if@repaso
\newif\if@examen
\@draftfalse % standard default state
\@repasofalse
\@examenfalse
% Declare explicit custom options
\DeclareOption{draft}{\@drafttrue}
\DeclareOption{repaso}{\@repasotrue}
\DeclareOption{examen}{\@examentrue}
% \DeclareOption{azul}{\AtEndOfClass{\RequirePackage{xcolor}\color{gray}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax
\LoadClass{exam}
\addpoints
\RequirePackage[spanish]{babel}
\RequirePackage{multicol}
%%%%%%% TOC AND SPACE TITLE %%%%%%%%%%%%%%
\RequirePackage{tocloft}
\setlength\cftparskip{-5pt} 
%%%%%%%%%%%%%% SECCIONES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
\titleformat{\section}
{\normalfont\fontsize{14}{5}\bfseries\scshape\color{darkgray!50!black}}{}{0.5em}{}
\titlespacing*{\section}{0pt}{0.5em}{0.3em}
\titleformat{\subsection}
{\normalfont\fontsize{12}{5}\bfseries\scshape\color{gray!50!black}}{}{0.5em}{}
\titlespacing*{\subsection}{0pt}{0.5em}{0.3em}
\titleformat{\subsubsection}
{\normalfont\fontsize{10}{5}\bfseries\scshape\color{lightgray!50!black}}{\thesubsubsection}{0.5em}{}
\titlespacing*{\subsubsection}{0pt}{0.5em}{0.3em}
\let\latexl@section\l@section
\def\l@section#1#2{\begingroup\let\numberline\@gobble\latexl@section{#1}{#2}\endgroup}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz}
\usetikzlibrary{shadows.blur,positioning}
\tikzset{%
node_wide/.style={
        draw, 
        rectangle,  
        text width=\textwidth-0.45cm,align=center,
        rounded corners=2pt,inner xsep=5pt,inner ysep=5pt,fill=white,
    },
    node_custom_width/.style={
        draw, 
        rectangle,  
        align=center,
        rounded corners=2pt,inner xsep=3pt,inner ysep=3pt,fill=white,
        blur shadow={
                    shadow opacity=50,
                    shadow yshift=-1mm,
                    shadow blur steps=5,
                    shadow blur extra rounding=5pt
                }
    },
    node_half_width/.style={
        draw, 
        rectangle,  
        text width=0.48\textwidth-0.2cm,
        rounded corners=2pt,inner xsep=5pt,inner ysep=5pt,fill=white,
        blur shadow={
                    shadow opacity=50,
                    shadow yshift=-1mm,
                    shadow blur steps=5,
                    shadow blur extra rounding=5pt
                }
    },
}
\RequirePackage{adjustbox}
\@ifpackageloaded{tcolorbox}{}{\RequirePackage[most]{tcolorbox}}
\newtcbox{\autocontrol}[1][]{%
  boxsep=1mm,
  colback=white,
  colframe=red!70!black,
  frame style={opacity=0.5},
  interior style={opacity=1},
  nobeforeafter,
  tcbox raise base,
  shrink tight,
  rotate=3,
  extrude by=1mm,
  enhanced,
  fuzzy shadow={0.15mm}{-0.25mm}{0mm}{0.1mm}{black},  #1
}

\RequirePackage{parskip} % Removes indent, adds vertical spacing
\RequirePackage{geometry} % Custom margins
\geometry{%
        letterpaper,
        includehead,
        left=15mm,
        right=15mm,
        top=5mm,
        bottom=25mm,
        headheight=10mm
    }
% Execute design changes based on chosen options
\if@draft
  \AtEndOfClass{
    \RequirePackage{background}
    \backgroundsetup{contents=DRAFT, color=red!30}
    \RequirePackage{xcolor}\color{gray}
    \geometry{showframe=true}
  }%
\fi
\RequirePackage{xfp,xfrac}
\RequirePackage{amssymb}
\RequirePackage{physics}
\renewcommand{\div}{\divisionsymbol}
\RequirePackage{longdivision}
\usepackage{lipsum}
\RequirePackage{dashrule}
\newcommand{\dashfill}{\leavevmode\leaders\hbox{\hdashrule[-2pt]{4pt}{0.5pt}{2pt}}\hfill\kern0pt}

\def\LOGO{%
    \begin{picture}(0,0)\unitlength=1cm
        \put (0.01,-0.02) {\includegraphics[width=\linewidth]{logo_shadow.png}}
        \put (0.0,-0.0) {\includegraphics[width=\linewidth]{logo.png}}
    \end{picture}
}
%%%% INPUTS
\newcommand{\themateria}{1}
\newcommand{\materia}[1]{\renewcommand{\themateria}{#1}}
\newcommand{\thegrado}{1}
\newcommand{\grado}[1]{\renewcommand{\thegrado}{#1}}
\newcommand{\thenivel}{1}
\newcommand{\nivel}[1]{\renewcommand{\thenivel}{#1}}
\newcommand{\thecampoformativo}{1}
\newcommand{\campoformativo}[1]{\renewcommand{\thecampoformativo}{#1}}
\newcommand{\thecicloescolar}{1}
\newcommand{\cicloescolar}[1]{\renewcommand{\thecicloescolar}{#1}}
\newcommand{\theunidad}{1}
\newcommand{\unidad}[1]{\renewcommand{\theunidad}{#1}}

\RequirePackage{enumitem}
\newcommand{\theaprendizajes}{1}
\newcommand{\aprendizajes}[1]{\renewcommand{\theaprendizajes}{
        \begin{itemize}[leftmargin=*,label=\small$\square$,itemsep=0pt,itemindent=0em]%
            #1%
        \end{itemize}%
    }}
\newcommand{\thecontrol}[1][]{%
    \ifprintanswers%
        {\begin{tikzpicture}[remember picture, overlay,shift=(current page.north)]%
             \node[#1]{%
                \autocontrol{%
                % \alterfont%
                % \shadowtext{%
                Soluciones propuestas%
                % } %
                }
            };
        \end{tikzpicture}}%
    \else%
    \fi%
}
\newcommand{\thereglas}{1}
\newcommand{\reglas}[1]{\renewcommand{\thereglas}{%
        \small Al comenzar este examen, aceptas las siguientes reglas:
        \begin{itemize}[topsep=1.5pt, partopsep=0pt,itemsep=1pt,parsep=0pt,label=\color{red!70!black}$\times$]%
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



















\newcounter{numberofrows}
\newcounter{numberofcolumns}

\AtBeginDocument{%
  \if!\ifnum9<1\numquestions!\fi%
     \setcounter{numberofrows}{\fpeval{ceil(\numquestions/20)}}%
     \setcounter{numberofcolumns}{\fpeval{ceil(\numquestions/12)}}%
  \else\setcounter{numberofrows}{1}\setcounter{numberofcolumns}{1}%
  \fi
    % These commands set up the running header on the top of the exam pages
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HEADER AND FOOTER ZONE %%%%%%%
    \pagestyle{headandfoot}
    \firstpageheader{}{}{}
    \if@examen
        \begin{tikzpicture}[remember picture]%% GENERAL TITLE %%%%
            \node[node_wide,draw=none] {%
            \hspace*{2cm}
            \begin{minipage}[b][][b]{0.75\textwidth}\centering
                Escuela Rafael Díaz Serdán\\
                \thecampoformativo \\
                \themateria \\ 
                \thegrado$^\circ$ de \thenivel \\
                Examen \@title \ \theunidad
            \end{minipage}%
            \begin{minipage}[b][][b]{0.118\textwidth}
                    \LOGO
                \end{minipage}
            };
        \end{tikzpicture}
    \fi
    \if@repaso
        \begin{tikzpicture}[remember picture]%% GENERAL TITLE %%%%
            \node[node_wide] (node1) {%
                \begin{minipage}[b][][b]{0.09\textwidth}
                    \LOGO
                \end{minipage}\hfill
                \begin{minipage}[b][][b]{0.9\textwidth}
                    {Escuela Rafael D\'iaz Serd\'an}\\
                    {\thecampoformativo   \hfill \thegrado$^\circ$ de \thenivel}\\
                    {\@author  \hfill \themateria}\\
                    {que onda  \hfill Adios}
                \end{minipage}
            };
            \node[node_custom_width,below=-18pt of node1]  {%
                \adjustbox{stack,min size={0.4\textwidth}{15pt},max size={0.65\textwidth}{20pt}}%
                {\sffamily Repaso \@title \ \theunidad}%
            };
        \end{tikzpicture}\\
    \fi
    \firstpagefooter{}{\thepage \ de \numpages}{}
    \ifprintanswers%
        \runningheader{LEFT SIDE}{CENTER}{RIGHT SIDE}
    \else%
        \runningheader{LEFT SIDE}{CENTER}{RIGHT SIDE}
    \fi%
    \runningfooter{}{\thepage \ de \numpages}{}
    \runningheadrule
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIKZPICTURE ZONE %%%%%%%%%%%%
    \thecontrol[yshift=-5cm,scale=1.5]

    \begin{tikzpicture}[remember picture]%% NAMES %%%%%%%%%%%%%%%%%%
        \node[text width=\textwidth-0.15cm,inner sep=0pt] (node3) {%%
            \begin{minipage}{0.7\textwidth}
                Nombre del alumno: \dashfill \\[.5em]
                Nombre del evaluador: \dashfill
            \end{minipage}\hfill
            \begin{minipage}{0.3\textwidth}
                Ciclo escolar: \dashfill \\[.5em]
                Fecha: \dashfill
            \end{minipage}
        };
    \end{tikzpicture}

    \begin{tikzpicture}[remember picture]%% GRADES %%%%%%%%%%%%%%%%%
         \node[node_wide,draw=none] (node5) {
                    \adjustbox{
                    min size={0.4\textwidth}{50pt},
                    max size={\textwidth}{300pt}
                    }{%
                    \multirowgradetable{\thenumberofrows}[questions]%
                    }%
         };
         \node[anchor=north west,
            style=rounded corners,yshift=18pt] at (node5.north west) {%
            \large Calificación%
        };
    \end{tikzpicture}

    \if@repaso
    \begin{multicols}{2}
    \tableofcontents
    \end{multicols}
    \vfill
    {
        \centering
        \begin{tikzpicture}[remember picture]%% ENUMERATED LIST %%%%%
            \node[node_wide] (node7) {%
                 \theaprendizajes
            };
            \node[anchor=north west,
                style=rounded corners,yshift=18pt] at (node7.north west) {%
                \large Procesos de Desarrollo del Aprendizaje%
            };
        \end{tikzpicture}
    }
    \newpage
    \fi
    %  \begin{tikzpicture}[remember picture]%% INSTRUCTIONS %%%%%
    %     \node[node_wide,text width=\textwidth-0.9cm] (node9) {%
    %          \begin{minipage}{\linewidth}
    %           \lipsum[3][1-10]
    %         \end{minipage}%
    %     };
    %     \node[anchor=north west,
    %         style=rounded corners,yshift=18pt] at (node9.north west) {%
    %         \Large\lipsum[1][16]%
    %     };
    % \end{tikzpicture}

    \if@examen
    \begin{tikzpicture}[remember picture]%% INSTRUCTIONS %%%%%
        \node[node_half_width,text width=0.3\textwidth] (node8) {%
            Lee con atenci\'on cada pregunta y realiza lo que se te pide.
            Desarrolla tus respuestas en el espacio determinado para cada solución.
            De ser necesario, utiliza una hoja en blanco por separado, anotando en ella tu nombre
            completo, el n\'umero del problema y la soluci\'on propuesta.
        };
        \node[anchor=north west,
            style=rounded corners,yshift=18pt] at (node8.north west) {%
            \large Instrucciones%
        };
    \end{tikzpicture}\hfill
    \begin{tikzpicture}[remember picture]%% REGLAS %%%%%
        \node[node_half_width,text width=0.65\textwidth] (node6) {%
              \thereglas
        };
        \node[anchor=north west,
            style=rounded corners,yshift=18pt] at (node6.north west) {%
            \large Reglas%
        };
    \end{tikzpicture}
    \fi

    % \if@examen
    % \begin{tikzpicture}[remember picture]%% INSTRUCTIONS and RULES %%%%%%%%%
    %     \node[text width=\textwidth,align=center] (node17) {%
    %             \begin{tikzpicture}[remember picture]
    %                 \node[draw, 
    %                 rectangle,  
    %                 text width=0.48\textwidth,align=center,
    %                 rounded corners=2pt,fill=white] (node6) {%
    %                      \begin{minipage}{\textwidth}
    %                         \begin{enumerate}
    %                             \item \lipsum[1][1-5] % First sentence of paragraph 1
    %                             \item \lipsum[1][2] % Second sentence of paragraph 1
    %                             \item \lipsum[1][3-4] % Third sentence of paragraph 1
    %                             \item \lipsum[1][11-14] % Third sentence of paragraph 1
    %                         \end{enumerate}\vfill
    %                     \end{minipage}%
    %                 };
    %                 \node[anchor=north west,
    %                     style=rounded corners,yshift=18pt] at (node6.north west) {%
    %                     \Large\lipsum[1][3]%
    %                 };
    %                 \node[right=5pt of node6] (node8) {%
    %                 \adjustbox{
    %                 min size={0.2\textwidth}{50pt},
    %                 max size={0.5\textwidth}{200pt}
    %                 }{%
    %                 % \multigradetable{\fpeval{\thenumberofcolumns}}[questions]%
    %                 \multicolumngradetable{\fpeval{\thenumberofcolumns}}[questions]%
    %                 }%
    %                 };
    %                 \node[anchor=north west,
    %                     style=rounded corners,yshift=18pt] at (node8.north west) {%
    %                     \Large\lipsum[1][5]%
    %                 };
    %             \end{tikzpicture}
    %     };
    % \end{tikzpicture}
    % \fi
}