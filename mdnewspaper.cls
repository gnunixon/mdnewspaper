%%
%% mdnewspaper class v0.1a
%% Author: Viorel Roman aka gnunixon
%% e-mail: gnunixon@gmail.com
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{mdnewspaper}
    [2010/01/03 v0.1a mdnewspaper class]
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mdnewspaper}[2010/01/03 mdnewspaper class]
\RequirePackage{ifthen}
\newlength{\mdnewspaper@imgsize}
\newlength{\mdnewspaper@coltitsize}
\newlength{\mdnewspaper@pageneed}
\newlength{\mdnewspaper@pageleft}
\newlength{\mdnewspaper@indexwidth}
\newcommand{\mdnewspaper@ncolumns}{0}
\newlength{\columnlines}
\setlength{\columnlines}{0 pt} % no lines by default
\newboolean{mdnewspaper@hyphenatedtitles}
\setboolean{mdnewspaper@hyphenatedtitles}{true}
\newboolean{mdnewspaper@ninepoints}
\setboolean{mdnewspaper@ninepoints}{false}
\newboolean{mdnewspaper@showgrid}
\setboolean{mdnewspaper@showgrid}{false}
\newboolean{mdnewspaper@a3paper}
\setboolean{mdnewspaper@a3paper}{false}
\newboolean{mdnewspaper@insidefrontpage}
\setboolean{mdnewspaper@insidefrontpage}{false}
\newcount\mdnewspaper@gridrows
\newcount\mdnewspaper@gridcolumns
\mdnewspaper@gridrows=100
\mdnewspaper@gridcolumns=54
\newcount\minraggedcols
\minraggedcols=5
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}
\DeclareOption{twocolumn}%
{\ClassWarning{mdnewspaper}{Option 'twocolumn' not available for mdnewspaper.}}
\DeclareOption{notitlepage}%
{\ClassWarning{mdnewspaper}{Option 'notitlepage' not available for mdnewspaper.}}
\DeclareOption{twoside}%
{\ClassWarning{mdnewspaper}{Option 'twoside' not available for mdnewspaper.}}
\DeclareOption{9pt}{\setboolean{mdnewspaper@ninepoints}{true}}
\DeclareOption{hyphenatedtitles}{\setboolean{mdnewspaper@hyphenatedtitles}{false}}
\DeclareOption{columnlines}{\setlength{\columnlines}{0.1 pt}}
\DeclareOption{showgrid}{\setboolean{mdnewspaper@showgrid}{true}}
\DeclareOption{a3paper}{\setboolean{mdnewspaper@a3paper}{true}}
\ProcessOptions\relax
\LoadClass[10pt, onecolumn, titlepage, a4paper]{article}
\RequirePackage{ifpdf}
\RequirePackage{multido}
\RequirePackage{datetime}
\RequirePackage{multicol}
\RequirePackage{fancyhdr}
\RequirePackage{fancybox}
\ifthenelse{\boolean{mdnewspaper@a3paper}}{%
\RequirePackage[a3paper,headsep=0.5cm,vmargin={2cm,2cm},hmargin={1.5cm,1.5cm}]{geometry}
}{
\RequirePackage[headsep=0.5cm,vmargin={2cm,2cm},hmargin={1.5cm,1.5cm}]{geometry}
}
\ifpdf
\RequirePackage[pdftex]{graphicx,color}
  \RequirePackage[pdftex]{hyperref}
\else
\RequirePackage{color}
\RequirePackage[dvips]{graphicx}
\RequirePackage[dvips]{hyperref}
\fi
\RequirePackage[absolute]{textpos} % absoulte positioning
\RequirePackage{hyphenat} % when hyphenate
\RequirePackage{wrapfig}
\RequirePackage{lastpage} % to know the last page number
\RequirePackage{setspace} % set space between lines
\RequirePackage{ragged2e}
\newcommand{\raggedFormat}{\RaggedRight}
\AtEndOfClass{\mdnewspaperInit}
\ifthenelse{\boolean{mdnewspaper@showgrid}}{%
\AtBeginDocument{
\grid[show]{\mdnewspaper@gridrows}{\mdnewspaper@gridcolumns}}
\advance\minraggedcols by -1
}{%
\AtBeginDocument{
\grid[]{\mdnewspaper@gridrows}{\mdnewspaper@gridcolumns}}
\advance\minraggedcols by -1
}
\ifthenelse{\boolean{mdnewspaper@ninepoints}}{
\renewcommand{\normalsize}{%
  \@setfontsize{\normalsize}{9pt}{10pt}%
  \setlength{\abovedisplayskip}{5pt plus 1pt minus .5pt}%
  \setlength{\belowdisplayskip}{\abovedisplayskip}%
  \setlength{\abovedisplayshortskip}{3pt plus 1pt minus 2pt}%
  \setlength{\belowdisplayshortskip}{\abovedisplayshortskip}}

\renewcommand{\tiny}{\@setfontsize{\tiny}{5pt}{6pt}}

\renewcommand{\scriptsize}{\@setfontsize{\scriptsize}{7pt}{8pt}}

\renewcommand{\small}{%
  \@setfontsize{\small}{8pt}{9pt}%
  \setlength{\abovedisplayskip}{4pt plus 1pt minus 1pt}%
  \setlength{\belowdisplayskip}{\abovedisplayskip}%
  \setlength{\abovedisplayshortskip}{2pt plus 1pt}%
  \setlength{\belowdisplayshortskip}{\abovedisplayshortskip}}

\renewcommand{\footnotesize}{%
  \@setfontsize{\footnotesize}{8pt}{9pt}%
  \setlength{\abovedisplayskip}{4pt plus 1pt minus .5pt}%
  \setlength{\belowdisplayskip}{\abovedisplayskip}%
  \setlength{\abovedisplayshortskip}{2pt plus 1pt}%
  \setlength{\belowdisplayshortskip}{\abovedisplayshortskip}}

\renewcommand{\large}{\@setfontsize{\large}{11pt}{13pt}}
\renewcommand{\Large}{\@setfontsize{\Large}{14pt}{16pt}}
\renewcommand{\LARGE}{\@setfontsize{\LARGE}{20pt}{22pt}}
\renewcommand{\huge}{\@setfontsize{\huge}{25pt}{28pt}}
\renewcommand{\Huge}{\@setfontsize{\Huge}{36pt}{36pt}}
}{}
\definecolor{color}{cmyk}{0, 1, 1, 0}
\definecolor{max}{cmyk}{0, 0.5, 0.5, 0.5}
\definecolor{min}{cmyk}{0.5, 0, 0.5, 0.5}
\newcommand{\wwwTxt}{http://nixon.legco.md}
\newcommand{\mdnewspaper@wwwFormat}{\sffamily}
\newcommand{\mdnewspaper@edition}{999.md}
\newcommand{\editionFormat}{\large\bfseries\texttt}
\newcommand{\headDateTimeFormat}{}
\newcommand{\mdnewspaper@headDateTime}{%
\headDateTimeFormat\date\hspace{5pt}$\parallel$\hspace{5pt}%
\textcolor{color}{\currenttime h}%
}
\newcommand{\valutaFormat}{\bfseries\sffamily}
\newcommand{\mdnewspaper@valuta}[1]{%
\noindent\textcolor{color}{{\valutaFormat #1}}%
}
\newcommand{\mdnewspaper@section}[0]{FRONT PAGE}
\newcommand{\mdnewspaper@headleft}{%
{{\usefont{T1}{pag}{m}{n}}\date}%
}
\newcommand{\mdnewspaper@headcenter}{%
\texttt{LinCore}}
}
\newcommand{\mdnewspaper@headright}{%
\textcolor{color}{\small\mdnewspaper@edition}%
\hspace*{5pt}\thepage
}

\newcommand{\heading}[3]{%
\renewcommand{\mdnewspaper@headleft}{#1}%
\renewcommand{\mdnewspaper@headcenter}{#2}%
\renewcommand{\mdnewspaper@headright}{#3}%
}
\newcommand{\mdnewspaper@footleft}{%
{\footnotesize\copyright\ \wwwTxt{}}%
}
\newcommand{\mdnewspaper@footcenter}{%
}
\newcommand{\mdnewspaper@footright}{%
}

\newcommand{\foot}[3]{%
\renewcommand{\mdnewspaper@footleft}{#1}%
\renewcommand{\mdnewspaper@footcenter}{#2}%
\renewcommand{\mdnewspaper@footright}{#3}%
}

%Style of title_1
\newcommand{\firstTitleFormat}{\Huge\sffamily\bfseries\flushleft}
\newcommand{\mdnewspaper@firstTitle}[1]{%
{{\noindent\ignorespaces
\ifthenelse{\boolean{mdnewspaper@hyphenatedtitles}}%
{\nohyphens{\firstTitleFormat #1 \vspace{5pt plus 1pt minus 2pt}}}%
{{\firstTitleFormat #1 \vspace{5pt plus 1pt minus 2pt}}}%
}}}
%End style of title_1

%Style for title_2
\newcommand{\secondTitleFormat}{\LARGE\sffamily\bfseries}
\newcommand{\mdnewspaper@secondTitle}[1]{%
{%
\noindent\ignorespaces\flushleft
\ifthenelse{\boolean{mdnewspaper@hyphenatedtitles}}%
{\nohyphens{\secondTitleFormat #1 \vspace{5pt plus 1pt minus 2pt}}}%
{{\secondTitleFormat #1 \vspace{5pt plus 1pt minus 2pt}}}%
}}
%End style for title_2

%Style for title_3
\newcommand{\thirdTitleFormat}{\Large\sffamily\bfseries}
\newcommand{\mdnewspaper@thirdTitle}[1]{%
{\noindent\ignorespaces\flushleft
\ifthenelse{\boolean{mdnewspaper@hyphenatedtitles}}%
{\nohyphens{\thirdTitleFormat #1 \vspace{5pt plus 1pt minus 2pt}}}%
{{\thirdTitleFormat #1 \vspace{5pt plus 1pt minus 2pt}}}%
}}
%End style for title_3

%Style for subtitles
\newcommand{\SubtitleFormat}{\large\bfseries}
\newcommand{\mdnewspaper@Subtitle}[1]{%
{\noindent\ignorespaces{\SubtitleFormat{#1} \vspace{2pt plus 1pt minus 2pt}}}%
}
%End style for subtitles

%Intertitle
\newcommand{\intert}[1]
{\vspace{5pt plus 1pt minus 2pt}
\begin{center}
\noindent\large{\bfseries{#1}}
\end{center}
\vspace{2pt plus 2pt minus 1pt}
}
%End intertitle

%Style of simple text
\newcommand{\TextFormat}{\normalsize}
%End style of simple text

%Semnatura
\newcommand{\signature}[1]
{\vspace{3pt plus 1pt minus 2pt}
\begin{flushright}
 \noindent\large{\bfseries{#1}}
\end{flushright}
}
%End semnatura

%Style for picture caption
\newcommand{\piccap}[1]{
\bfseries\itshape\normalsize{#1}
}
%End style for picture caption

\newcommand{\mdnewspaper@firstText}[1]{%
\begin{multicols}{3}
{\noindent\ignorespaces\TextFormat #1}%
\end{multicols}
}

\newcommand{\mdnewspaper@onecolText}[1]{
{\noindent\ignorespaces{\TextFormat #1}}
}

\newcommand{\pagesFormat}{\bfseries\footnotesize}
\newcommand{\mdnewspaper@pages}[1]%
{\noindent\textcolor{gray}{\rule[-3pt]{8mm}{12pt}}\textcolor{white}{\rule[-3pt]{0.5mm}{12pt}}\textcolor{gray}{\rule[-3pt]{1mm}{12pt}}
\hspace{-7mm}\textcolor{color}{\pagesFormat\MakeUppercase{#1}}}
\textblockorigin{1cm}{1cm}
\newdimen\mdnewspaper@dx
\newdimen\mdnewspaper@dy
\newcount\mdnewspaper@cx
\newcount\mdnewspaper@cy
\newcommand{\grid}[3][]{
\mdnewspaper@dx=\textwidth%
\mdnewspaper@dy=\textheight%
\mdnewspaper@cx=#3% %columns
\mdnewspaper@cy=#2% %rows
%
\count1=#3%
\advance\count1 by 1

\count2=#2%
\advance\count2 by 1

\divide\mdnewspaper@dx by #3
\divide\mdnewspaper@dy by #2

\setlength{\TPHorizModule}{\mdnewspaper@dx}
\setlength{\TPVertModule}{\mdnewspaper@dy}

\ifthenelse{\equal{#1}{show}}{
\multido{\mdnewspaper@nrow=0+1}{\count2}{
\begin{textblock}{\mdnewspaper@cx}(0,\mdnewspaper@nrow)
\rule[0pt]{\textwidth}{.1pt}
\end{textblock}
}

\multido{\mdnewspaper@ncol=0+1}{\count1}{
\begin{textblock}{\mdnewspaper@cy}(\mdnewspaper@ncol,0)
\rule[0pt]{.1pt}{\textheight}
\end{textblock}
}
}{}
}
\newcommand{\mdnewspaperInit}{
\setlength{\headheight}{14pt}
\renewcommand{\headrulewidth}{0.4pt}

\pagestyle{fancy}

\setlength{\columnseprule}{\columnlines}
\setlength{\fboxrule}{0.1 pt}

}
\newcommand{\logofile}{/var/www/vhosts/mdnewspaper/img/nixcore}
\newcommand{\logo}[0]{
%% Heading %%
\begin{textblock}{43}(1,3)
\noindent\includegraphics[width=\textwidth]{\logofile}

\noindent\rule{\textwidth}{.4pt}

\vspace{3pt}{\large{\bfseries{\mdnewspaper@edition}}\hfill\large{\today}}

\vspace{-3pt}\noindent\rule{\textwidth}{.4pt}
\end{textblock}

}

\newcommand{\mylogo}[1]{
{#1}

\noindent
\mdnewspaper@editionLogo\hspace{5pt}
\hrulefill
\hspace{5pt}\mdnewspaper@headDateTime
}
\newcommand{\edition}[1]{\renewcommand{\mdnewspaper@edition}{#1}}
\newenvironment{frontpage}[0]
{
\setboolean{mdnewspaper@insidefrontpage}{true}
\thispagestyle{empty}
\pdfbookmark[1]{FRONT PAGE}{\thepage}
\logo

}%
{
\thispagestyle{empty}
\clearpage
\newpage

\fancyhead{}
\fancyfoot{}
\fancyhead[R]{\mdnewspaper@headright}
\fancyhead[L]{\mdnewspaper@headleft}
    \fancyhead[C]{\mdnewspaper@headcenter}
    \fancyfoot[R]{\mdnewspaper@footright}
    \fancyfoot[L]{\mdnewspaper@footleft}
\fancyfoot[C]{\mdnewspaper@footcenter}
\renewcommand{\headrulewidth}{0.4pt}
\setboolean{mdnewspaper@insidefrontpage}{false}

}

%Table of Content
\newcommand{\sumar}[4]
{\sloppy
\begin{textblock}{38}(#1,#2)
\mdnewspaper@secondTitle{\raggedright #3

}

\mdnewspaper@onecolText{#4}
\end{textblock}
}
%End of TOC

%One column news
\newcommand{\onecol}[6]
{\sloppy
\begin{textblock}{10}(#1,#2)
\mdnewspaper@pages{#6}
\vspace{-5pt plus 2pt minus 2pt}
\mdnewspaper@thirdTitle{\raggedright #3

}

\mdnewspaper@Subtitle{#4}

\mdnewspaper@onecolText{#5}
\end{textblock}
}
%End one column news

%Article in 2 columns
\newcommand{\mdnewspaper@twocolText}[1]{
\begin{multicols}{2}
{\noindent\ignorespaces{\TextFormat #1}}
\end{multicols}
}
\newcommand{\twocol}[6]
{
\begin{textblock}{21}(#1, #2)
\mdnewspaper@pages{#6}
\vspace{-5pt}
\mdnewspaper@secondTitle{\raggedright #3

}
\mdnewspaper@Subtitle{#4}
\mdnewspaper@twocolText{#5}
\end{textblock}
}
%End article in 2 columns

%Article in 3 columns
\newcommand{\mdnewspaper@threecolText}[1]{
\begin{multicols}{3}
{\noindent\ignorespaces{\TextFormat #1}}
\end{multicols}
}
\newcommand{\threecol}[6]
{
\begin{textblock}{32}(#1, #2)
\mdnewspaper@pages{#6}
\vspace{-5pt}
\mdnewspaper@secondTitle{#3}

\mdnewspaper@Subtitle{#4}

\mdnewspaper@threecolText{#5}
\end{textblock}
}
%End article in 3 columns

%Article in 4 columns
\newcommand{\mdnewspaper@fourcolText}[1]{
\begin{multicols}{4}
{\noindent\ignorespaces{\TextFormat #1}}
\end{multicols}
}
\newcommand{\fourcol}[6]
{
\begin{textblock}{43}(#1, #2)
\mdnewspaper@pages{#6}
\vspace{-5pt}
\mdnewspaper@firstTitle{\raggedright #3

}

\mdnewspaper@Subtitle{#4}

\mdnewspaper@fourcolText{#5}
\end{textblock}
}
%End article in 4 columns 

%Five columns
\newcommand{\mdnewspaper@fivecolText}[1]{
\begin{multicols}{5}
{\noindent\ignorespaces{\TextFormat #1}}
\end{multicols}
}
\newcommand{\fivecol}[6]
{
\begin{textblock}{54}(#1, #2)
\mdnewspaper@pages{#6}
\vspace{-5pt}
\mdnewspaper@firstTitle{\raggedright #3

}

\mdnewspaper@Subtitle{#4}

\mdnewspaper@fivecolText{#5}
\end{textblock}
}
%End five columns

%Photography without article
\newcommand{\fotografie}[5]
{
\begin{textblock}{#1}(#2,#3)
\begin{figure}
\noindent\includegraphics[width=\textwidth]{#4}
\piccap{#5}
\end{figure}
\end{textblock}
}
%End Photography without article

\newcommand{\mdnewspaper@inexpandedtitle}[1]{
\begin{minipage}{.95\textwidth}
\begin{center}
\noindent\Large\textbf{#1}
\end{center}
\end{minipage}
}


\newcommand{\columntitle}[2]{
\vspace*{5pt}
\begin{center}
\setlength{\fboxsep}{5pt}
\setlength{\shadowsize}{2pt}
\addtolength{\mdnewspaper@coltitsize}{\columnwidth}
\addtolength{\mdnewspaper@coltitsize}{-1\columnsep}
\addtolength{\mdnewspaper@coltitsize}{-5pt}
\addtolength{\mdnewspaper@coltitsize}{-1\shadowsize}
\ifthenelse{\equal{#1}{shadowbox}}{%
\shadowbox{%
\mdnewspaper@incolumntitle{\mdnewspaper@coltitsize}{#2}%
}%
}{}
\ifthenelse{\equal{#1}{doublebox}}{%
\doublebox{%
\mdnewspaper@incolumntitle{\mdnewspaper@coltitsize}{#2}%
}%
}{}
\ifthenelse{\equal{#1}{ovalbox}}{%
\ovalbox{%
\mdnewspaper@incolumntitle{\mdnewspaper@coltitsize}{#2}%
}%
}{}
\ifthenelse{\equal{#1}{Ovalbox}}{%
\Ovalbox{%
\mdnewspaper@incolumntitle{\mdnewspaper@coltitsize}{#2}%
}%
}{}
\ifthenelse{\equal{#1}{lines}}{
\hrule
\vspace*{5pt}
\begin{center}
\noindent\normalsize\textbf{#2}
\end{center}
\vspace*{5pt}
\hrule
}{}
\end{center}
}
\renewcommand{\date}{%
\longdate{\today}%
}
\newcommand{\newsection}[1]{
\pdfbookmark[0]{#1}{\thepage} %bookmark para el pdf
\renewcommand{\mdnewspaper@section}{#1}
}
%Horizontal line
\newcommand{\horline}[3]{
\begin{textblock}{#1}(#2, #3)
 \noindent\hrulefill
\end{textblock}
}
%End horizontal line

%Vertical line
\newcommand{\verline}[3]{
\begin{textblock}{#1}(#2, #3)
 \noindent\vrule height #1\baselineskip
\end{textblock}
}
%End vertical line
\newcommand{\nextpage}[0]{\newpage}

%Foto in one column
\newcommand{\fotoin}[2]{
\begin{figure}
 \noindent\includegraphics[width=\columnwidth]{#1}
  \piccap{#2}
\vspace{3pt}
\end{figure}
}
%End foto in one column

%Citat in one column
\newcommand{\citat}[1]{
\vspace{10pt}
\noindent\hrule height 2pt \vspace{5pt}

{\noindent\normalsize\bfseries\itshape{#1}}

\noindent\hrulefill
\vspace{5pt}
}
%End citat
\endinput
%%
%% End of file `mdnewspaper.cls'.
