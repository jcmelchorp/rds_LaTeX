\def\fileversion{2.0}
\def\filedate{2026/08/02}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{repaso_layout}[\filedate\space Plantilla Repaso RDS Version \fileversion\space by J.Melchor]
\LoadClass{exam}
\DeclareOption{addpoints}{\addpoints}
\DeclareOption{answers}{\printanswers}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{exam}}
\ProcessOptions\relax
\RequirePackage{tikz}
\usetikzlibrary{shadows.blur,positioning}
\RequirePackage{adjustbox}
\@ifpackageloaded{tcolorbox}{}{\RequirePackage[most]{tcolorbox}}
\RequirePackage{parskip} % Removes indent, adds vertical spacing
\RequirePackage[
    %showframe=true,
    letterpaper,
    includehead,
    left=15mm,
    right=15mm,
    top=5mm,
    bottom=25mm,
    headheight=10mm,% Set \headheight to 10mm
]{geometry} % Custom margins
\RequirePackage{xfp}
\usepackage{lipsum}

\newcounter{numberofrows}
\newcounter{numberofcolumns}

\newcommand{\DrawLine}[1][\linewidth]{%
  \begin{tikzpicture}
    \path[use as bounding box] (0,0) -- (#1,0);
    \draw[color=blue,dashed,dash phase=2pt] (0-\kvtcb@boxsep,0)--(#1-\kvtcb@rightlower+\kvtcb@boxsep,0);
  \end{tikzpicture}%
}
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
    \firstpagefooter{}{\thepage \ de \numpages}{}
    \ifprintanswers%
        \runningheader{LEFT SIDE}{CENTER}{RIGHT SIDE}
    \else%
        \runningheader{LEFT SIDE}{CENTER}{RIGHT SIDE}
    \fi%
    \runningfooter{}{\thepage \ de \numpages}{}
    \runningheadrule
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIKZPICTURE ZONE %%%%%%%
    \begin{tikzpicture}[remember picture,
        node_ancho/.style={
        draw, 
        rectangle,  
        text width=\textwidth-0.45cm,align=center,
        rounded corners=2pt,inner xsep=5pt,inner ysep=5pt,fill=white,
        blur shadow={
                    shadow opacity=50,
                    shadow yshift=-1mm,
                    shadow blur steps=5,
                    shadow blur extra rounding=5pt
                }
    },
    node_titulo/.style={
        draw, 
        rectangle,  
        align=center,
        rounded corners=2pt,inner xsep=5pt,inner ysep=5pt,fill=white,
        blur shadow={
                    shadow opacity=50,
                    shadow yshift=-1mm,
                    shadow blur steps=5,
                    shadow blur extra rounding=5pt
                }
    },
    node_columns/.style={
        draw, 
        rectangle,  
        text width=0.5\textwidth,
        rounded corners=2pt,inner xsep=5pt,inner ysep=5pt,fill=white,
        blur shadow={
                    shadow opacity=50,
                    shadow yshift=-1mm,
                    shadow blur steps=5,
                    shadow blur extra rounding=5pt
                }
    }]
        \node[node_ancho] (node1) {%
            \begin{minipage}{0.1\textwidth}
                \includegraphics[width=1.5cm]{logo.png}
            \end{minipage}\hfill
            \begin{minipage}{0.9\textwidth}
                {Escuela Rafael D\'iaz Serd\'an}\\[0.1em]
                {hola como estas  \hfill Adios jardín querido}\\[-0.2em]
                {hola como estas  \hfill Adios jardín querido}\\[-0.2em]
                {que onda  \hfill Adios}
            \end{minipage}
        };
        \node[node_titulo,below=-18pt of node1] (node2) {%
            \adjustbox{stack,color=blue!20,min size={0.3\textwidth}{10pt},max size={0.5\textwidth}{25pt}}%
            {\sffamily\bfseries \lipsum[1][12]}%
        };
        \node[text width=\textwidth-0.45cm,align=center,
            inner sep=0pt,below=25pt of node1] (node3) {%%
            \begin{minipage}{0.75\textwidth}
                Nombre del alumno: \ \DrawLine[10.4cm]\\[.5em]
                Nombre del evaluador: \ \DrawLine[10cm]
            \end{minipage}\hfill
            \begin{minipage}{0.25\textwidth}
                Ciclo escolar: \ \DrawLine[2.2cm]\\[.5em]
                Fecha: \ \DrawLine[3.2cm]
            \end{minipage}
        };
         \node[text width=\textwidth-0.45cm,align=center,inner sep=0pt,
            below=25pt of node3] (node5) {
            % \begin{tikzpicture}[text width=\textwidth] 
            %    \node {%
                    \adjustbox{
                    min size={0.4\textwidth}{50pt},
                    max size={\textwidth}{300pt}
                    }{%
                    % \isdefined\numquestions\multirowgradetable{\fpeval{\numquestions/5}}[questions]\fi%
                    % \@ifundefined{numquestions}{\multirowgradetable{1}[questions]}{\multirowgradetable{\fpeval{\numquestions/5}}[questions]}
                    % \multirowgradetable{\isnum{numquestions}}[questions]%
                    %\multirowgradetable{\fpeval{\numquestions/5}}[questions]%
                    \multirowgradetable{\thenumberofrows}[questions]%
                    }%
            %     };
            % \end{tikzpicture}
         };
         \node[anchor=north west,
            style=rounded corners,yshift=18pt] at (node5.north west) {%
            \Large\lipsum[1][5]%
        };
        \node[draw, 
        rectangle,  
        text width=\textwidth-0.9cm,align=center,
        rounded corners=2pt,inner xsep=5pt,inner ysep=5pt,fill=white,
            below=25pt of node5] (node7) {%
             \begin{minipage}{\textwidth}
                \begin{enumerate}
                    \item \lipsum[1][1-5] % First sentence of paragraph 1
                    \item \lipsum[1][2] % Second sentence of paragraph 1
                    \item \lipsum[1][3-4] % Third sentence of paragraph 1
                \end{enumerate}
            \end{minipage}%
        };
        \node[anchor=north west,
            style=rounded corners,yshift=18pt] at (node7.north west) {%
            \Large\lipsum[1][3]%
        };
        \node[text width=\textwidth,align=center,
            below=25pt of node7] (node17) {%
                \begin{tikzpicture}[remember picture]
                    \node[draw, 
                    rectangle,  
                    text width=0.48\textwidth,align=center,
                    rounded corners=2pt,fill=white] (node6) {%
                         \begin{minipage}{\textwidth}
                            \begin{enumerate}
                                \item \lipsum[1][1-5] % First sentence of paragraph 1
                                \item \lipsum[1][2] % Second sentence of paragraph 1
                                \item \lipsum[1][3-4] % Third sentence of paragraph 1
                                \item \lipsum[1][11-14] % Third sentence of paragraph 1
                            \end{enumerate}\vfill
                        \end{minipage}%
                    };
                    \node[anchor=north west,
                        style=rounded corners,yshift=18pt] at (node6.north west) {%
                        \Large\lipsum[1][3]%
                    };
                    \node[right=5pt of node6] (node8) {%
                    \adjustbox{
                    min size={0.2\textwidth}{50pt},
                    max size={0.5\textwidth}{200pt}
                    }{%
                    % \multigradetable{\fpeval{\thenumberofcolumns}}[questions]%
                    \multicolumngradetable{\fpeval{\thenumberofcolumns}}[questions]%
                    }%
                    };
                    \node[anchor=north west,
                        style=rounded corners,yshift=18pt] at (node8.north west) {%
                        \Large\lipsum[1][5]%
                    };
                \end{tikzpicture}
        };
    \end{tikzpicture}\\
}