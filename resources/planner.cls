\def\fileversion{1.0}
\def\filedate{2026/08/25}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{planner}[2023/01/20 Plantilla Planificador RDS]
\LoadClass{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax\ProcessOptions\relax
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{cicloescolar}
\RequirePackage[most]{tcolorbox}
\tcbuselibrary{skins,raster,breakable} % Load the breakable library
\RequirePackage{amssymb}
\RequirePackage{tabularx}
\RequirePackage[margin=0.4in]{geometry}
\RequirePackage{pdflscape} % Permite rotar una sola página de forma correcta en el PDF
\RequirePackage{ragged2e}
\RequirePackage{multicol,multirow}
\RequirePackage{jsonparse} % Load the json package
\RequirePackage{anyfontsize}
\RequirePackage{adjustbox}
%%\RequirePackage{planner}
\RequirePackage{graphicx} % for \scalebox
\RequirePackage{xcolor} % For defining colors
\RequirePackage{colortbl} % For coloring table elements
\RequirePackage{ifthen}
\RequirePackage{enumitem} % for custom \item
\RequirePackage{xparse} %for NewDocumentCommand
\RequirePackage{etoolbox}
% \RequirePackage{l3sys-query} %for query JSON files
% \RequirePackage{lipsum}
\RequirePackage{shadowtext}
\shadowoffset{0.4pt}
\shadowcolor{black}

\DTMsetdatestyle{fechacorta}
\pagestyle{empty}
\newcolumntype{Y}{>{\RaggedRight\arraybackslash}X}
\renewcommand{\arraystretch}{1.2}

\arrayrulecolor{rdsColor}
\setlength{\columnsep}{10pt}
\setlength{\arrayrulewidth}{0.1pt}
%%% DEFINITIONS
\def\notasbox{%
    \begin{tcolorbox}[%
        enhanced,
        breakable,
        colback=white,
        colframe=rdsColor,
        boxrule=0.4pt,
        fontupper=\color{rdsColor}\sffamily,
        underlay unbroken and first={%
            \ifnumequal{\tcbsegmentstate}{1}{
                \begin{tcbclipinterior}
                \draw[help lines,rdsColor!60!white, ystep=\baselineskip, xstep=\linewidth] (segmentation.west) grid (frame.south east);
                \end{tcbclipinterior}
            }{} 
        },
        underlay middle and last={%
            \ifnumequal{\tcbsegmentstate}{1}{
                \begin{tcbclipinterior}\color{rdsColor}
                \draw[help lines,rdsColor!40!white, ystep=\baselineskip, xstep=\linewidth] (segmentation.west) grid (frame.south east);
                \end{tcbclipinterior}
            }{\ifnumequal{\tcbsegmentstate}{2}{
                \begin{tcbclipinterior}\color{rdsColor}
                \draw[help lines,rdsColor!40!white, ystep=\baselineskip, xstep=\linewidth] (frame.north west) grid (frame.south east);
                \end{tcbclipinterior}
                }{} 
            }
        }]
            Notas: 
            \tcblower
             \hfill \\ \hfill \\ \hfill \\ \hfill \\ \hfill \\ \hfill \\ \hfill \\ \hfill \\ \hfill \\ \hfill \\ \hfill 
    \end{tcolorbox}
}
\tcbset{
    unitbox/.style={
        colbacktitle=white,
        colback=rdsColor!0.5!white,
         colframe=rdsColor,
        colframe=white,
        coltitle=black,
        boxrule=0.4pt,
        boxsep=0pt,
        left=10pt,
        right=10pt,
        top=10pt,
        bottom=10pt,
        subtitle style={
            fontupper=\sffamily,
            boxrule=0.2pt,
            boxsep=2mm,
            top=0mm,
            bottom=0mm,
            colback=rdsColor!10,
            colupper=green!30!black,
        }
    },
    semanabox/.style={
        coltitle=green!30!black,
        colframe=rdsColor,
        colback=rdsColor!1!white,
        colbacktitle=rdsColor!10,
        boxrule=0.1pt,
        frame style={rdsColor},
        top=0pt,
        bottom=0pt,
        left=-7pt,
        right=0pt
    },
    titlebox/.style={
        colbacktitle=white,
        colback=rdsColor!0.5!white,
        colframe=white,
        coltitle=black,
        boxrule=0pt,
        boxsep=0pt,
        left=10pt,
        right=0pt,
        top=0pt,
        bottom=5pt,
        subtitle style={
            fontupper=\sffamily\small,
            boxrule=0.2pt,
            boxsep=2mm,
            top=0mm,
            bottom=0mm,
            colback=rdsColor!10,
            colupper=green!30!black,
        }
    },
    infobox/.style={
        coltitle=green!30!black,
        colframe=rdsColor,
        colback=rdsColor!1!white,
        colbacktitle=rdsColor!10,
        boxrule=0.4pt,
        frame style={rdsColor},
        left=1mm,right=1mm,top=1mm,bottom=1mm,
    }
}
\newtcolorbox{activitybox}[2][]{%
  attach boxed title to top center = {yshift=-\tcboxedtitleheight/2},
  top=5pt,
  bottom=3pt,
  left=3pt,
  right=3pt,
  colback      = white,
  colframe     = rdsColor,
  fonttitle    = \sffamily,
  colbacktitle = rdsColor!45!white,
  boxrule=0.4pt,
  halign=center,
  boxsep=0mm,
  title        = \large\textbf{#2},#1,
  on line,
  enhanced,
}
\newtcolorbox{subsectionbox}[1][]{%
    size=fbox,
    top=0pt,%boxsep=2mm,
    bottom=0pt,
    width=\linewidth/8,
    grow to left by=7mm,
    colback = rdsColor!45!white,
    colframe     = rdsColor,
    leftrule=2mm, 
    drop fuzzy shadow=black,
    fontupper=\color{white}\bfseries\sffamily\RaggedLeft,
    #1,
    on line,
    enhanced,
}

\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=2pt,fill=white,circular glow={fill=rdsColor!40!white}] (char) {#1};}}
\newcommand*\cte[1]{\tikz[baseline=(char.base)]{
			\node[shape=circle,inner sep=2pt,pattern={Lines[distance=2pt, angle=45, line width=0.1pt]},pattern color=green!50!black] (char) {#1};}}
\newcommand*\free[1]{\tikz[baseline=(char.base)]{
			\node[shape=circle,inner sep=2pt,pattern={Lines[distance=2pt, angle=-45, line width=0.1pt]},pattern color=red!50!black] (char) {#1};}}
\newcommand*\exam[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=2pt,fill=white] (char) {#1};}}
\newcommand*\padres[1]{\tikz[baseline=(char.base)]{
            \node[shape=rectangle,draw=black!75,fill=white] (char) {#1};}}
\newcommand*\booknode[1]{\tikz[baseline=(char.base)]{
            \node[shape=rounded rectangle,line width=0.5pt,draw=rdsColor!50,
            rounded rectangle east arc=concave,xshift=-0.35em,
            inner xsep=0pt,inner ysep=4pt,
            % pattern={Lines[distance=0.5pt, angle=0, line width=0.1pt]},pattern color=green!50!black,
            fill=rdsColor!50!white,
            scale=1,overlay] (char) {#1};
            % \begin{scope}[on background layer]
            %     \fill[white,hape=rounded rectangle,rounded rectangle east arc=concave,xshift=-0.4em,] (-.8,-.8) rectangle (.8,.8);
            %   \end{scope}
            }}

\def\LOGO{%
    \begin{picture}(0,0)\unitlength=2cm
        \put (-0.15,-0.6) {\includegraphics[width=2cm]{logo45.png}}
       % \put (0.045,-0.6) {\includegraphics[width=3cm]{logo.png}}
    \end{picture}
}



\newcommand{\loadunit}[3]{%
    \def\disciplina{\classtitle{#2#1}}
    \def\gradogrupo{\leveltitle{#1}}
    \JSONParseFromFile{\weekdata}{../resources/json/2627/#2#1_u#3.json}
    \JSONParseValue[store in=\campoformativo]{\weekdata}{general.CampoFormativo}
\JSONParseValue[store in=\asignatura]{\weekdata}{general.Asignatura}
\JSONParseValue[store in=\grado]{\weekdata}{general.Grado}
\JSONParseValue[store in=\nivel]{\weekdata}{general.Nivel}
\JSONParseValue[store in=\unidad]{\weekdata}{general.Unidad}
\JSONParseValue[store in=\nombreunidad]{\weekdata}{general.NombreDeLaUnidad}
\JSONParseValue[store in=\duracion]{\weekdata}{general.DuracionEnSemanas}
\JSONParseValue[store in=\horasporsemana]{\weekdata}{general.HorasPorSemana}
\JSONParseValue[store in=\horastotales]{\weekdata}{general.HorasTotales}
\JSONParseValue[store in=\docente]{\weekdata}{general.Docente}
\JSONParseValue[store in=\fechainicial]{\weekdata}{general.FechaInicial}
\JSONParseValue[store in=\fechafinal]{\weekdata}{general.FechaFinal}
\JSONParseValue[store in=\fechacreacion]{\weekdata}{general.FechaDeCreacion}
\JSONParseValue[store in=\fechaupdate]{\weekdata}{general.FechaDeActualizacion}
    \def\unitinfo{%
        \tcbox[colback=rdsColor!5!white,colframe=rdsColor,size=fbox,on line]{ {\sffamily Unidad} #3}
    }
    \def\cicloescolar{%
        \tcbox[colback=red!10!white,colframe=rdsColor,size=fbox,on line]{\currentyear-\nextyear}
    }
    %\QueryFiles[reverse]{*.json}{\JSONParseFromFile{\weekdata}{##1}}
    % \def\unitcalendar{
        % \unitcalendarselector{#3}
    % }
}
% Comando para el diseño del encabezado
\def\unitboxtitle{%
   \begin{minipage}{0.15\textwidth}
        \LOGO
    \end{minipage}%
  \begin{minipage}{0.4\textwidth}
        \schoolinfounit
    \end{minipage}%
}

 \def\schoolinfounit{\RaggedRight%
        {\color{rdsColor}\Large Escuela Rafael Díaz Serdán}\\[-0.5em]
        {\color{gray!40!black}\scriptsize\sffamily 30PES0329R \hspace{10em} turno matutino  }\\
        {\color{green!20!black}\large\sffamily Plan de Trabajo Escolar}\\
        {\sffamily Profesor:}\docente \\ 
        \campoformativo \\
        \large{\shadowtext{\gradogrupo} \qquad \shadowtext{\disciplina}}
    }
\def\schoolinfo{\RaggedRight%
        {\color{rdsColor}\fontsize{14}{10}\selectfont Escuela Rafael Díaz Serdán}\\[-0.5em]
        {\color{gray!40!black}\fontsize{6}{6}\selectfont \sffamily 30PES0329R \hfill turno matutino \hspace{2pt}}\\[0.2em]
        {\color{green!20!black} \fontsize{10}{10}\selectfont \sffamily Planeación didáctica semanal}\\
        {\color{black!90}{\sffamily Profesor:} Julio César Melchor Pinto}\\
        {\sffamily Disciplina:} \shadowtext{\disciplina} \\
        {\sffamily Grado y grupo:}  \shadowtext{\gradogrupo}\\
    }
   
\newcommand{\rangofechas}[2]{%
    \tcbox[on line,size=fbox,arc=1.5pt,boxrule=0.5pt,colback=orange!10!white,colframe=rdsColor!50,sharp corners,rounded corners=west]{% sharp corners=southeast,
   \DTMdate#1 < \DTMdate#2%
    }%
}

% \newcommand{\rangofecha}[2]{
%     \begin{tikzpicture}[baseline]
%         \node (box) [rdsColor,
%             draw,                   % Dibuja el borde
%             fill=white,
%             anchor=base,baseline,
%             rounded corners=4pt,    % Redondea las esquinas
%             minimum width=3cm,      % Ancho total
%             minimum height=1.5em,    % Alto total
%             yshift=0.3em,
%             blur shadow={
%                 shadow opacity=50,
%                 shadow blur steps=5,
%                 shadow blur extra rounding=5pt
%             },
%         ] {}; % El nodo no lleva texto dentro, solo define la forma.
%         \draw[rdsColor] ([xshift=-1mm]box.north) -- ([xshift=1mm]box.center) -- ([xshift=-1mm]box.south);
%         \node at ([xshift=-0.8cm]box.center) {#1};
%         \node at ([xshift=0.8cm]box.center) {#2};
%     \end{tikzpicture}%
% }



% \def\fillingradebox{\resizebox{1cm}{1em}{\raisebox{-0.16em}{$\Box$}}}
\newcommand{\fillingradebox}[1][]{\tikz[overlay]{\draw[black!75,thin,rounded corners=1,#1] (0,0) rectangle (1, 1);}}

\newcommand{\boxesline}{%
\begin{tikzpicture}[yshift=-0.2em]
    \foreach \x in {0,...,0} {
 \begin{scope}[shift={(\x*1.0,0)}]
            % Dibujamos las 3 caras visibles del cubo
            % Todas tienen borde negro (por defecto) y relleno blanco
            % \draw[fill=white] (0.2,0.2) rectangle (1.7,1.7);
            % \draw[fill=white] (0,0) -- ++(0.2,-0.2) -- ++(1.2,0) -- ++(-0.2,0.2) -- cycle; % Cara superior
            %  \draw[fill=white] (1.2,0) -- ++(0.2,-0.2) -- ++(0,1.2) -- ++(-0.2,0.2) -- cycle;; % Cara lateral derecha
             \draw[fill=white,drop shadow=black,rounded corners,] (0,0) rectangle (1.0,1.0);                                     % Cara frontal
        \end{scope}
    }
\end{tikzpicture}
}

\newcommand{\boxesbox}{%
\begin{tikzpicture}[yshift=-0.2em,rotate=270]
    \foreach \x in {0,...,0}{
 \begin{scope}[shift={(\x*1.0,0)}]
            % Dibujamos las 3 caras visibles del cubo
            % Todas tienen borde negro (por defecto) y relleno blanco
            % \draw[fill=white] (0.2,0.2) rectangle (1.7,1.7);
            % \draw[fill=white] (0,0) -- ++(0.2,-0.2) -- ++(1.2,0) -- ++(-0.2,0.2) -- cycle; % Cara superior
            %  \draw[fill=white] (1.2,0) -- ++(0.2,-0.2) -- ++(0,1.2) -- ++(-0.2,0.2) -- cycle;; % Cara lateral derecha
             \draw[fill=white,drop shadow=black,rounded corners,] (0,0) rectangle (1.0,1.0);                                     % Cara frontal
        \end{scope}
    }
\end{tikzpicture}
}

\def\itemboxes{%
    \tcbox[enhanced,on line,drop fuzzy shadow=black,size=fbox,colback=orange!10!white]{\fontsize{20}{8}\selectfont\JSONParseArrayValue}\\[1em]%\raisebox{-0.75em}{\boxesline}\\
}
\def\itembox{%
    \tcbox[enhanced,drop fuzzy shadow=black,size=fbox,on line,colback=orange!10!white]{\JSONParseArrayValue}
}
\def\itemitemize{%
    \item \JSONParseArrayValue
}
\def\columnbox{%
\tcbox[enhanced,on line,drop fuzzy shadow=black,size=fbox,colback=violet!10!white]{\fontsize{20}{8}\selectfont\JSONParseArrayValue}\\[0.5em] %
}

%%%% FOR PLANNER
\newcommand{\arrayitemize}[2]{%
\JSONParseArrayMapFunction[
    code before={\begin{itemize}[label=$\circ$,leftmargin=5pt,itemsep=0pt,itemindent=0em]},
    code after={\end{itemize}}
]{\weekdata}{weeks[#1].#2}{\itemitemize}
}
% Comando para el diseño del encabezado
\newcommand{\planTitle}[8]{\small%
    \begin{minipage}{0.07\textwidth}
        \LOGO
    \end{minipage}%
    \begin{minipage}{0.23\textwidth}
        \schoolinfo
    \end{minipage}%
    \begin{tabularx}{0.7\textwidth}{rYr}
        {\sffamily Campo formativo:} & Saberes y Pensamiento Científico  &  \tcbox[colback=red!10!white,colframe=rdsColor,size=fbox,on line]{2025-2026} \unitinfo  \\ 
        {\sffamily Tema:}  & \multirow[t]{2}{\linewidth}{#3} & \tcbox[colback=yellow!20!white,colframe=rdsColor,size=fbox,on line]{ {\large\sffamily Semana} {\Large #6}} \tcbox[colframe=rdsColor,size=fbox,on line]{ {\Large #5} \begin{minipage}[b]{0.9cm}\sffamily\tiny Períodos\\lectivos\end{minipage}} \\
        & & \rangofecha{#7}{#8}  \\
        {\sffamily Contenido:}  &  \multicolumn{2}{l}{#2}\\
        {\sffamily Ejes articuladores:} &   \multicolumn{2}{l}{#1}\\
        {\sffamily Lección:} &   \multicolumn{2}{l}{#4}\\ 
    \end{tabularx}
}

\newcommand{\weekbottom}[2]{%
\begin{multicols}{3}\centering
    \begin{tcolorbox}[infobox, title={\sffamily \large Proceso de desarrollo de aprendizaje (PDA):}]
    \tcboxfit[colback=white,colframe=white,top=0mm,bottom=0mm,left=0mm,right=0mm,height=1.5cm, fit basedim=11pt]{#1}
    \end{tcolorbox}

    \columnbreak%

    \begin{tabularx}{0.95\linewidth}{c|c}
        \multicolumn{1}{p{0.45\linewidth}}{\centering \sffamily Elabora:}  & \multicolumn{1}{p{0.45\linewidth}}{\centering \sffamily Autoriza:}                \\
        \hline
        \footnotesize \sffamily Nombre y firma & \footnotesize \sffamily Nombre y firma \\
        \begin{minipage}[b][1.5cm][b]{0.45\linewidth}%
            %\includegraphics[width=\linewidth]{null.png}%
            \end{minipage} & {} \\
    \end{tabularx} \\
    {\centering \fontsize{6}{4}\selectfont  \color{black!60} Última revisión del documento:  \today}%

    \columnbreak%

    \begin{tcolorbox}[infobox, title={\sffamily \large Evaluación formativa:}]
        \tcboxfit[colback=white,colframe=white,top=0mm,bottom=0mm,left=0mm,right=0mm,height=1.5cm, fit basedim=11pt]{#2}
    \end{tcolorbox}%
\end{multicols}
}

\NewDocumentCommand{\badges}{ m m }{
    \begin{tcolorbox}[infobox,size=normal,boxrule=0.4pt,left=1mm,right=1mm,top=1mm,bottom=1mm,title={\sffamily  Referencias:}]%
        \tcboxfit[colback=white,colframe=white,top=0mm,bottom=0mm,left=0mm,right=0mm,height=1.5cm]{#2}
    \end{tcolorbox}
    \begin{tcolorbox}[infobox,size=normal,boxrule=0.4pt,left=1mm,right=1mm,top=1mm,bottom=1mm, title={\sffamily  Vinculación del campo formativo:}]
        \tcboxfit[colback=white,colframe=white,top=0mm,bottom=0mm,left=0mm,right=0mm,height=1.5cm]{#1}
    \end{tcolorbox}
}

\NewDocumentCommand{\weekcontents}{ m m m }{%
%\newcommand{\weekcontents}[8]{%
\begin{minipage}[t][12.5cm][b]{0.72\linewidth}
    \tcboxfit[colback=white,colframe=white,top=1mm,bottom=0mm,left=0mm,right=5pt,height=12.5cm]{%
    \begin{subsectionbox} INICIO: \end{subsectionbox}%
    \quad #1 \\ \\
    \begin{subsectionbox} DESARROLLO: \end{subsectionbox}%
    \quad #2 \\ \\
    \begin{subsectionbox} CIERRE: \end{subsectionbox}%
    \quad #3
    }
\end{minipage}%
}


\newcommand{\boardlist}{%
     \begin{minipage}{0.2\textwidth}
        \includegraphics[width=3.2cm]{logo45.png}\\
        {\LARGE\cicloescolar\\\unitinfo}\\ \vfill
        \rotatebox{90}{\Huge{\shadowtext{\campoformativo}}} \ %
         \rotatebox{90}{\fontsize{42}{24}\selectfont\shadowtext{\gradogrupo}} \ %
         \rotatebox{90}{\fontsize{42}{24}\selectfont\shadowtext{\disciplina}} 
    \end{minipage}%
    \begin{minipage}{0.75\textwidth}\RaggedLeft%
        \begin{center}
            \scshape\huge \color{rdsColor}\shadowtext{Alumnos}
        \end{center}
          \JSONParseArrayMapFunction[
                    code before={},
                    code after={}
                ]{\weekdata}{general.Alumnos}{\itemboxes}
    \end{minipage}
    \newpage\noindent
\JSONParseArrayMapFunction[
    code before={},
    code after={}
]{\weekdata}{general.Nociones}{\columnbox}
}

