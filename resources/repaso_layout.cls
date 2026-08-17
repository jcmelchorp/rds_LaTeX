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
\RequirePackage{comfortaa}
% \RequirePackage{ragged2e} %%% for justifying/right/left text
%%%%%%%% COLOR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{color, colortbl}
\RequirePackage[xcdraw,svgnames,x11names,usenames,dvipsnames,table]{xcolor} % Required for custom color
\definecolor{colorrds}{HTML}{0060A0} % Custom colour
\definecolor{rdsdark}{HTML}{003050}
\definecolor{almond}{rgb}{0.94, 0.87, 0.8}
\definecolor{brickred}{rgb}{0.8, 0.25, 0.33}
\definecolor{corn}{rgb}{0.98, 0.93, 0.36}
\definecolor{darkpastelred}{rgb}{0.76, 0.23, 0.13}
\definecolor{MainColor}{HTML}{4C8BA7}
\definecolor{SubjectColor}{HTML}{98780F}
\definecolor{ExampleTitle}{HTML}{3F2906}
\definecolor{ExampleCard}{HTML}{275819}
\definecolor{PreguntaTitle}{HTML}{3F2906}
\definecolor{PreguntaCard}{HTML}{C2A224}
\definecolor{Guia}{HTML}{FFDDDD}
\definecolor{ChapterMainColor}{named}{RawSienna}
\definecolor{ChapterSecColor}{named}{DarkGoldenrod}
\definecolor{SectionMainColor}{named}{OliveDrab}
\definecolor{SectionSecColor}{named}{DarkGoldenrod}
\definecolor{SubsectionMainColor}{named}{OliveDrab}
\definecolor{SubsectionSecColor}{named}{FireBrick}
\definecolor{SubsubsectionMainColor}{named}{DarkGoldenrod}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{multicol} %% suport multicolumn grades table
\RequirePackage{etoolbox}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}
\setlength{\columnsep}{20pt}
\RequirePackage{parskip}
% \RequirePackage[colorlinks = true,urlcolor=colorrds, linkcolor = colorrds]{hyperref}
\RequirePackage{geometry} % Custom margins
\geometry{%
        letterpaper,
        includehead,
        left=20mm,
        right=20mm,
        top=5mm,
        bottom=25mm,
        headheight=15mm
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
\RequirePackage{xfp} %%% Evaluate numerical aritmethic expresions
\RequirePackage{xfrac} %%% Fraction customatization
\RequirePackage{xlop} %%% for math aritmethic operations
\RequirePackage{amssymb,amsmath}  %%% for math symbols
\decimalpoint
\RequirePackage{physics}  %%% math and physics units, variables and expresions
\renewcommand{\div}{\divisionsymbol} %%% reescribimos el símbolo de división para reescribir el com,ando \div
\RequirePackage{longdivision} %%% math methods for long division algoriythm
%%%%%%%%%%%%%%%%%% SECCIONES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec,tocloft}    %%% customize section label on the document
\titleformat{\section}       %%% section
{\normalfont\fontsize{14}{5}\bfseries\scshape\color{darkgray!50!black}}{}{0.5em}{}
\titlespacing*{\section}{0pt}{0.5em}{0.3em}
\titleformat{\subsection}    %%% subsection
{\normalfont\fontsize{12}{5}\bfseries\scshape\color{gray!50!black}}{}{0.5em}{}
\titlespacing*{\subsection}{0pt}{0.5em}{0.3em}
\titleformat{\subsubsection} %%% subsubsection
{\normalfont\fontsize{10}{5}\bfseries\scshape\color{lightgray!50!black}}{\thesubsubsection}{0.5em}{}
\titlespacing*{\subsubsection}{0pt}{0.5em}{0.3em}
%%%%%%%%%% This 2 lines calls to omit the prefix number of sections in TOC 
\let\latexl@section\l@section
\def\l@section#1#2{\begingroup\let\numberline\@gobble\latexl@section{#1}{#2}\endgroup}
\setlength\cftparskip{0pt} %%% Title height from first line of TOC
\setlength\linefillheight{0.5cm} %%% Line height of TOC
%%%%%%%%%%%%%%%%% Boxes %%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{adjustbox}  %%% Scalable boxes
\RequirePackage{tikz}       %%% Full custom drawing package
\usetikzlibrary{shadows,shadows.blur,positioning,shapes.misc,shapes.symbols}
\tikzset{%
node_wide/.style={draw=colorrds, rectangle,  text width=\textwidth-0.45cm,align=center,rounded corners=2pt,inner sep=5pt,fill=white},
node_custom_width/.style={draw=colorrds, rectangle,  align=center,rounded corners=2pt,inner xsep=3pt,inner ysep=3pt,fill=white,blur shadow={shadow opacity=30,shadow yshift=-1mm,shadow blur steps=5,shadow blur extra rounding=5pt}},
node_half_width/.style={draw, rectangle,  text width=0.48\textwidth-0.2cm,rounded corners=2pt,inner xsep=5pt,inner ysep=5pt,fill=white,blur shadow={shadow opacity=30,shadow yshift=-1mm,shadow blur steps=5,shadow blur extra rounding=5pt}},
instructionbox/.style={draw=colorrds,fill=white, rectangle,inner sep=10pt, style=rounded corners,blur shadow={shadow opacity=30,shadow yshift=-1mm,shadow blur steps=5,shadow blur extra rounding=5pt}},
instructiontitle/.style={anchor=north west,fill=white,style=rounded corners,yshift=12pt,xshift=6pt}
}
\@ifpackageloaded{tcolorbox}{}{\RequirePackage[most]{tcolorbox}}
\tcbuselibrary{skins}
\tcbset{
  %sharp corners,
  enhanced,
  colback = white,
  fonttitle=\bfseries,
  %before skip = 1mm,    % add extra space before the box
  %after skip = 1mm      % add extra space after the box
}  
\newtcbox{\autocontrol}[1][]{boxsep=2mm,colback=white,colframe=red!70!black,frame style={opacity=1},interior style={opacity=1},nobeforeafter,tcbox raise base,shrink tight,rotate=3,extrude by=1mm,enhanced,fuzzy shadow={0.15mm}{-0.25mm}{0mm}{0.1mm}{black},  #1}
\newtcolorbox{pregunta}[1][]{%
  colframe=green,
  colbacktitle=white,
  fonttitle=\color{green!40!black}\bfseries\sffamily,
  #1
}
\newtcolorbox{porejemplo}[1][]{%
  colframe=yellow,
  colbacktitle=yellow!10!white,
  coltitle=yellow!50!black,
  %fonttitle=\comfortaa,
  #1
}
%%%%%%%%%%%%%%%%% QUESTIONS, PARTS AND CHOICES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginEnvironment{choices}{\vspace{0.5\baselineskip}}
\AtEndEnvironment{choices}{\vspace{0.1\baselineskip}}
%\AtBeginEnvironment{oneparchoices}{\vspace{0.3\baselineskip}}
%\AtEndEnvironment{oneparchoices}{\vspace{-0.8\baselineskip}}
\AtBeginEnvironment{checkboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{checkboxes}{\vspace{0.1\baselineskip}}
\AtBeginEnvironment{oneparcheckboxes}{\vspace{0.1\baselineskip}}
\AtEndEnvironment{oneparcheckboxes}{\vspace{0.1\baselineskip}}
\newcommand\comillas[1]{``#1''}
\newcommand{\midmatch}{\hspace{0.75in}\underline{\hspace{0.5in}}}
\newcommand{\tf}[1][{}]{%
    \fillin[#1][1cm]%
}
\newcommand{\circled}[1]{%
  \tikz[baseline=(char.base)]{%
    \node[magnetic tape,magnetic tape tail extend=0.6cm, magnetic tape tail=0.2, draw, inner sep=2pt] (char) {#1};
    \node [anchor=south west,cloud, cloud puffs=7,fill=white, aspect=2,inner sep=0pt,minimum width=0.1pt, minimum height=0.1pt,xshift=-2pt,yshift=2pt,blur shadow={shadow opacity=75, shadow yshift=-2pt,shadow xshift=1.5pt}] at (char.north east) {\tiny\sffamily\color{rdsdark}+\totalpoints};
    %\node [anchor=south west,cloud, cloud puffs=11,fill=white, aspect=2,inner sep=0.5pt,minimum width=0.1pt, minimum height=0.1pt,xshift=-4pt,yshift=3pt,blur shadow={shadow opacity=80,shadow yshift=-0.8pt,shadow xshift=0.8pt,shadow blur steps=5,shadow blur extra rounding=0.1pt}] at (char.north east) {\tiny\sffamily\color{colorrds}+\totalpoints};
   % \node [anchor=north,tape,draw,text=black!75, tape bend top=in and out, tape bend bottom=in and out, tape bend height=2pt,minimum width=1cm,inner sep=0pt,fill=white,yshift=-2pt] at (char.south east) {\tiny\sffamily{\color{white}\bfseries\totalpoints} \ \points};
    %\node[anchor=west,rounded rectangle,draw=yellow!50!black,rounded rectangle west arc=concave,rotate=45,fill=yellow!20, inner sep=1pt,xshift=-4pt,yshift=5pt, rounded rectangle arc length=90] at (char.east) {\tiny\sffamily {\color{colorrds}\totalpoints} \points};
  }%
}

%\renewcommand\choicelabel{\circled{\thechoice}}
% \qformat{\color{BrickRed}\circled{\thequestion}}
% \renewcommand{\solutiontitle}{\noindent\hspace{-0.2cm}}
\renewcommand{\thepartno}{\alph{partno}}
\renewcommand{\partlabel}{\sffamily\thepartno .}
\renewcommand{\solutiontitle}{\noindent\textbf{Soluci\'on:}\quad}
\checkboxchar{$\square$}
\CorrectChoiceEmphasis{\color{red!50!gray}\bf}
\checkedchar{$\checkmark$}
\pointpoints{pt}{pts}
% \newcounter{ejemplonum}
% \setcounter{ejemplonum}{0}

\if@examen
    \renewcommand\questionlabel{\color{brown!50!black}\circled{\thequestion}}
    \pointsinmargin
    \pointformat{}
%    \pointformat{\color{yellow!50!black}\tcbox[on line,enhanced,boxsep=1pt,boxrule = 1pt,top=10pt,bottom=5,right=5pt,left=5pt,colframe=yellow!70!black,
%    overlay={
%    \node[
%      anchor=north,
%      inner sep=3pt,
%     % draw=red!75!black,
%     % fill=red!20,
%      font=\sffamily\scriptsize
%    ] at (frame.north) {\textbf{\color{colorrds}\totalpoints} \points };
%  }]{\color{white}pp}
%  }
    \newcounter{preguntanum}
    \setcounter{preguntanum}{0}
    \newcommand\ejemplosboxed[2][0]{%
         \refstepcounter{preguntanum}%
        % \stepcounter{ejemplonum}
        %\setcounter{numquestions}{\theejemplonum}
        \question[#1]{#2}%
    }%
    \newcounter{ejemplonum}
    \setcounter{ejemplonum}{0}
    \newcommand\questionboxed[2][0]{%
    \refstepcounter{ejemplonum}
   % \question[#1]{%
   % \begin{pregunta}[adjusted title={ Ejercicio \theejemplonum} \hfill {\color{blue}\rule[-1mm]{0.7cm}{0.2mm} de \totalpoints \ \points}]%
   %     #2%
   % \end{pregunta}%
    %\addtocounter{question}{-1}
    % \addtocounter{numquestions}{-1}
    %}%
}%
\fi
\if@repaso
\renewcommand\questionlabel{}
\pointsinmargin
\pointformat{}
\newcounter{ejemplonum}
\setcounter{ejemplonum}{0}
\newcommand\questionboxed[2][0]{%
\refstepcounter{ejemplonum}
    \question[#1]{%
    \begin{pregunta}[adjusted title={ Ejercicio \theejemplonum} \hfill {\color{blue}\rule[-1mm]{0.7cm}{0.2mm} de \totalpoints \ \points}]%
        #2%
    \end{pregunta}%
    %\addtocounter{question}{0}
    %\addtocounter{numquestions}{0}
    }%
}%
\newcounter{preguntanum}
\setcounter{preguntanum}{0}
\newcommand\ejemplosboxed[2][0]{%
    \refstepcounter{preguntanum}%pt
    % \question[#1]{%
    \begin{porejemplo}[adjusted title={Ejemplo \thepreguntanum}]% \hfill {\color{blue}\rule[-1mm]{0.7cm}{0.2mm} de #1 \ \points}]%
        \printanswers #2%
    \end{porejemplo}%
    % }
    %\addtocounter{numquestions}{-1}
}%
%%%%%%%%%% HOOKS (questions, parts and choices)
\renewcommand{\questionshook}{%
    \setlength{\topsep}{-20mm}%
    \setlength{\leftmargin}{0pt}%
    \labelwidth\leftmargin\advance\labelwidth+\labelsep%
}
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
















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
             \node[#1,yshift=-15mm,xshift=118pt]{%
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
        \begin{itemize}[leftmargin=*,topsep=1.5pt, partopsep=0pt,itemsep=1pt,itemindent=0em,parsep=0pt,label=\color{red!70!black}$\times$]%
            #1
        \end{itemize}
        Si no consideraste alguna de estas reglas,
        comunícalo a tu profesor.
    }}
\reglas{
    \item No se permite \textbf{salir} del sal\'on de clases. %\faToiletPaperSlash
    \item No se permite intercambiar o \textbf{prestar} ningún tipo de material.
    \item No se permite el uso de \textbf{celular} o cualquier \textbf{otro dispositivo}.
    \item No se permite el uso de \textbf{apuntes}, \textbf{libros}, notas o formularios.
    \item No se permite \textbf{mirar} el examen de otros alumnos.
    \item No se permite la \textbf{comunicaci\'on} oral o escrita con otros alumnos.
}


\newcommand{\instructionbox}[3][fill=white]{%
    \begin{tikzpicture}%
        \node [instructionbox, #1] (box)
        {%
            \adjustbox{minipage=.98\linewidth}{%
                \normalfont #3
            }%
        };
        \node[instructiontitle] at (box.north west) {\comfortaa\bfseries\color{Sepia} #2};
    \end{tikzpicture}%
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
                {\Large\color{colorrds}  Escuela Rafael D\'iaz Serd\'an}\\
                {\thecampoformativo}\\[0.1em]
                {\bfseries\large{\color{SubjectColor}\themateria} }\\
                {\color{MainColor}\thegrado$^\circ$ de \thenivel} \\[0.1em]
                {\large Examen \@title \ \theunidad}\\
            \end{minipage}%
            \begin{minipage}[b][][b]{0.118\textwidth}
                    \LOGO
                \end{minipage}
            };
        \end{tikzpicture}\\
    \fi
    \if@repaso
        \begin{tikzpicture}[remember picture]%% GENERAL TITLE %%%%
            \node[node_wide] (node1) {%
                \begin{minipage}[b][][b]{0.08\textwidth}
                    \LOGO
                \end{minipage}\hfill
                \begin{minipage}[b][][b]{0.9\textwidth}
                    {\hspace*{-1pt}\Large\comfortaa\color{colorrds}Escuela Rafael D\'iaz Serd\'an}\\
                    {\thecampoformativo\hfill{\Large\color{MainColor}\thegrado$^\circ$ de \thenivel}}\\[-0.2em]
                    {{\hspace*{-1pt}\footnotesize\scshape\@author}\hfill{\bfseries{\color{SubjectColor}\themateria}}}\\[-0.5em]
                    {\adjustbox{minipage=.25\textwidth}{\color{gray}\sffamily\fontsize{5}{5}\selectfont Rev: \today}}
                \end{minipage}
            };
            \node[node_custom_width,below=-10pt of node1]  {%
                \adjustbox{stack,min size={0.4\textwidth}{20pt},max size={0.65\textwidth}{15pt}}%
                {\comfortaa\color{colorrds} Repaso \@title \ \theunidad}%
            };
        \end{tikzpicture}\\
    \fi
    \firstpagefooter{}{\color{colorrds}\thepage \ de \numpages}{}
    \runningheader{\color{SubjectColor}\themateria}{Examen \@title \ \theunidad \ \thecontrol}{\color{MainColor}\thegrado$^\circ$ de \thenivel}
    \runningfooter{}{\color{colorrds}\thepage \ de \numpages}{}
    \runningheadrule
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TIKZPICTURE ZONE %%%%%%%%%%%%
    \thecontrol[scale=1.5]

    \begin{tikzpicture}[remember picture]%% NAMES %%%%%%%%%%%%%%%%%%
        \node[text width=\textwidth-0.15cm,inner sep=0pt] (node3) {%%
            \begin{minipage}{0.7\textwidth}\comfortaa\small
                Nombre del alumno: \dashfill \\[0.75em]
                Nombre del evaluador: \dashfill
            \end{minipage}\hfill
            \begin{minipage}{0.3\textwidth}\comfortaa\small
                Ciclo escolar: \dashfill \\[0.75em]
                Fecha: \dashfill
            \end{minipage}
        };
    \end{tikzpicture}

    \begin{tikzpicture}[remember picture]%% GRADES %%%%%%%%%%%%%%%%%
         \node[node_wide,draw=colorrds!20,inner sep=1pt] (node5) {
                    \adjustbox{
                    min size={0.2\textwidth}{50pt},
                    max size={\textwidth}{200pt}
                    }{%
                    \hqword{Pregunta}\hpgword{Página}\hpword{Puntos}\hsword{Obtenidos}\htword{Total}\vqword{Pregunta}\vpgword{P\'gina}\vpword{Puntos}\vsword{Ganados}\vtword{Total}%\cellwidth{0.5em}%
        \arrayrulecolor{colorrds!20}\arrayrulewidth=0.1pt\relax%
                    \multirowgradetable{\thenumberofrows}[questions]%
                    }%
         };
         \node[instructiontitle] at (node5.north west) {\comfortaa\bfseries\color{Sepia} Calificación:%
        };
    \end{tikzpicture}

    \if@repaso
    \begin{multicols}{2}\footnotesize
    \tableofcontents
    \end{multicols}

    \begin{minipage}{\textwidth}
        \instructionbox{Procesos de Desarrollo del Aprendizaje:}{\theaprendizajes}
    \end{minipage}
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
    \begin{minipage}{\textwidth}
    \begin{minipage}[t][][b]{.28\textwidth}
        \instructionbox{Instrucciones:}{%
            Lee con atenci\'on cada pregunta y realiza lo que se te pide.
            Desarrolla tus respuestas en el espacio determinado para cada solución.
            De ser necesario, utiliza una hoja en blanco por separado, anotando en ella tu nombre
            completo, el n\'umero del problema y la soluci\'on propuesta.
        }%
    \end{minipage}\hspace{0.8cm}%
    \begin{minipage}[t][][b]{.62\textwidth}
        \instructionbox{Reglas:}{\thereglas}
    \end{minipage}
\end{minipage}
    % \begin{tikzpicture}[remember picture]%% INSTRUCTIONS %%%%%
    %     \node[node_half_width,text width=0.29\textwidth,draw=colorrds] (node8) {%
    %         \justify Lee con atenci\'on cada pregunta y realiza lo que se te pide.
    %         Desarrolla tus respuestas en el espacio determinado para cada solución.
    %         De ser necesario, utiliza una hoja en blanco por separado, anotando en ella tu nombre
    %         completo, el n\'umero del problema y la soluci\'on propuesta.
    %     };
    %     \node[anchor=north west,
    %         style=rounded corners,yshift=18pt] at (node8.north west) {%
    %         \large Instrucciones%
    %     };
    % \end{tikzpicture}
    % \begin{tikzpicture}[remember picture]%% REGLAS %%%%%
    %     \node[node_half_width,text width=0.65\textwidth,draw=colorrds] (node6) {%
    %           \thereglas
    %     };
    %     \node[anchor=north west,
    %         style=rounded corners,yshift=18pt] at (node6.north west) {%
    %         \large Reglas%
    %     };
    % \end{tikzpicture}
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