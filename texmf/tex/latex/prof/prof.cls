    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                                                               %
    %     prof.cls          encodage : utf8                         %
    %                                                               %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                                                               %
    %           Créé par Alain Matthes le 26-12-2006.               %
    %                                                               %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Objet :  Classe LaTeX  et Styles pour des « textes mathématiques ».
%% modifié le 05/01/07
%% plus d'option dvi, ne requiert plus ifpdf
%<–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––>
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
 
%<–––––––––––––––– Définitions relatives au package –––––––––––––––––––––––––>
\newcommand*{\PackageName}{prof}
\newcommand*{\PackageVersion}{2}
\newcommand*{\filedate}{2007/05/11}
%<–––––––––––––––––––––––– Identification Part      –––––––––––––––––––––––––>
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{\PackageName}%
[\filedate \space Version:\space \PackageVersion \space par Alain Matthes ]
%<–––––––––––––––––––––––––< Packages obligatoires >–––––––––––––––––––––––––>
\RequirePackage{etex}
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{framed}
\RequirePackage{ifpdf}
\RequirePackage{xkeyval}[2005/11/25]
%<––––––––––––––––––––––< Variables d'options >––––––––––––––––––––––––––––––>
%
% Cette classe est basée sur la classe article. 
% Quelques options de la classe article sont utilisées.
%
% ––––––––––––––––––––––< Options personnelles >–––––––––––––––––––––––––––––>

% nodate        : pas de date dans l'entête.
% nopage        : pas de numéros de page dans l'entête.
% landscape     : mode paysage.
% nostyle       : style article pour les listes.

\newif\if@lm\@lmfalse
\newif\if@oneside\@onesidetrue
\newif\if@twoside\@twosidefalse
\newif\if@nodate\@nodatefalse
\newif\if@nopage\@nopagefalse
\newif\if@landscape\@landscapefalse
\newif\if@bbpage\@bbpagefalse
\newif\if@nostyle\@nostylefalse

\newcommand*{\my@encoding}{utf8}

\DeclareOption{a4paper}{%
\setlength\paperheight{297mm}\setlength\paperwidth{210mm}}%a4 obligatoire
\DeclareOption{oneside}{\@onesidetrue\@twosidefalse\@mparswitchfalse}
\DeclareOption{twoside}{\@onesidefalse\@twosidetrue\@mparswitchtrue}
\DeclareOption{nodate}{\@nodatetrue}

\DeclareOption{nopage}{\@nopagetrue}

\DeclareOption{lm}{\@lmtrue}
\DeclareOption{fourier}{\@lmfalse\@cmrfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{bbpage}{\@bbpagetrue}

\DeclareOption{applemac}{\renewcommand*{\my@encoding}{applemac}}
\DeclareOption{latin1}{\renewcommand*{\my@encoding}{latin1}}
\DeclareOption{utf8}{\renewcommand*{\my@encoding}{utf8}}

\DeclareOption{nostyle}{@nostyletrue}
\DeclareOption{landscape}{%
    \setlength\@tempdima{\paperheight}%
    \setlength\paperheight{\paperwidth}%
    \setlength\paperwidth{\@tempdima}
    \@landscapetrue}%
%
% Options de la classe article non autorisées.
%
\newcommand*{\@superflu}[1]
    {Option "\CurrentOption" superflue pour cette classe.}
\newcommand*{\@nonvalable}[1]
    {Option "\CurrentOption" non valable pour cette classe.}
%
\DeclareOption{10pt}        {\ClassWarning{prof}{\@nonvalable}}
\DeclareOption{a4paper}     {\ClassWarning{prof}{\@superflu}}
\DeclareOption{11pt}        {\ClassWarning{prof}{\@superflu}}
\DeclareOption{12pt}        {\ClassWarning{prof}{\@nonvalable}}
\DeclareOption{letterpaper} {\ClassWarning{prof}{\@nonvalable}}
\DeclareOption{legalpaper}  {\ClassWarning{prof}{\@nonvalable}}
\DeclareOption{a5paper}     {\ClassWarning{prof}{\@nonvalable}}
\DeclareOption{b5paper}     {\ClassWarning{prof}{\@nonvalable}}
\DeclareOption{onecolumn}   {\ClassWarning{prof}{\@nonvalable}}
\DeclareOption{twocolumn}   {\ClassWarning{prof}{\@nonvalable}}
\DeclareOption{titlepage}   {\ClassWarning{prof}{\@nonvalable}}
\DeclareOption{notitlepage} {\ClassWarning{prof}{\@nonvalable}}
\DeclareOption{fleqn}       {\ClassWarning{prof}{\@nonvalable}}
\DeclareOption{leqno}       {\ClassWarning{prof}{\@nonvalable}}
%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––– Options par défaut
%
% a4
% 11pt
% utf8 
% oneside
% fourier with upright
% date 
% time
% page
%
%<––––––––––––––––––––  Éxécution et chargement –––––––––––––––––––––––––––––>
%
\ExecuteOptions{oneside}
\ProcessOptions\relax
%
\if@oneside \typeout{oneside used} \else \typeout{oneside not used} \fi
\if@twoside \typeout{twoside used} \else \typeout{twoside not used} \fi
%
% –––––––––––––––––––––––    Format avec geometry –––––––––––––––––––––––––––>
%
\newcommand*{\@proftextwidthhoriz}{24cm}
\newcommand*{\@proftextwidthvert}{16cm}
\newcommand*{\@profheadheight}{25pt}
\newcommand*{\@proftop}{2cm}
\newcommand*{\@profbottom}{2cm} 
\newcommand*{\@profheadsep}{12pt} 
\newcommand*{\@proffootskip}{25pt} 
\newcommand*{\@auteur}{Nom de l'auteur} 
\newcommand*{\@lycee}{Nom de l'\'etablissement}
\newcommand*{\@discipline}{Discipline}
\newcommand*{\@page}{\if@nopage \else \textit{Page}\ \thepage \fi}
\newcommand*{\@when}{\quand\ }
\newcommand*{\@time}{Dur\'ee~:~\@temps}
\newcommand\myheadrulewidth{0.2pt}
\newcommand\myfootrulewidth{0.2pt}
\newcommand\myheadrule{\vspace{8pt}\hrule}
%
% ––––––––––––––––––––––––––– Taille des fontes –––––––––––––––––––––––––––––>
\renewcommand*\normalsize{%
\@setfontsize\normalsize\@xipt{13.6}%
\abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
\abovedisplayshortskip \z@ \@plus3\p@
\belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
\belowdisplayskip \abovedisplayskip
\let\@listi\@listI}
%
\normalsize
%
\newcommand*\small{%
\@setfontsize\small\@xpt\@xiipt
\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
\abovedisplayshortskip \z@ \@plus3\p@
\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
\def\@listi{\leftmargin\leftmargini
            \topsep 6\p@ \@plus2\p@ \@minus2\p@
            \parsep 3\p@ \@plus2\p@ \@minus\p@
            \itemsep \parsep
            }%
\belowdisplayskip \abovedisplayskip
}
%
\newcommand*\footnotesize{%
\@setfontsize\footnotesize\@viiipt{9.5}%
\abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
\abovedisplayshortskip \z@ \@plus\p@
\belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
\def\@listi{\leftmargin\leftmargini
            \topsep 4\p@ \@plus2\p@ \@minus2\p@
            \parsep 2\p@ \@plus\p@ \@minus\p@
            \itemsep \parsep
            }%
\belowdisplayskip \abovedisplayskip
}
%
\newcommand*\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
\newcommand*\tiny{\@setfontsize\tiny\@vipt\@viipt{8}}
\newcommand*\large{\@setfontsize\large\@xiipt{14.5}}
\newcommand*\Large{\@setfontsize\Large\@xivpt{18}}
\newcommand*\LARGE{\@setfontsize\LARGE\@xviipt{22}}
\newcommand*\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand*\Huge{\@setfontsize\Huge\@xxvpt{30}}
%
% –––––––––––––––––––––Fin    Taille des fontes –––––––––––––––––––––––––––––>
% –––––––––––––––––––––      Taille de la page  –––––––––––––––––––––––––––––>

\def\before@exo{\par\medskip}
\def\after@exo{}
\def\before@part{\par\bigskip}
\def\after@part{}

\InputIfFileExists{profparam.cfg}{\typeout{Local file profparam.cfg utilisé}}{\typeout{profparam.cfg non trouvé}}
\if@landscape \PassOptionsToPackage{landscape,textwidth=\@proftextwidthhoriz}{geometry}%
\else%
\PassOptionsToPackage{textwidth=\@proftextwidthvert}{geometry} \fi%

\RequirePackage[%
           \ifpdf pdftex\else dvips\fi,
            a4paper,%
            top        = \@proftop,%
            bottom     = \@profbottom,%
            headheight = \@profheadheight,%
            headsep    = \@profheadsep,%
            footskip   = \@proffootskip%
                ]{geometry}%

%<–––––––––––––––––––––––– Chargement des Packages ––––––––––––––––––––––––––>

% Recherche du fichier comportant la demande des packages si prof.cfg n'est pas trouvé on charge le fichier par défaut profdefaut.cfg, sinon on ne charge rien.
%
\InputIfFileExists{prof.cfg}%
{\typeout{Local file prof.cfg used}}{%
\InputIfFileExists{profdefaut.cfg}%
{\typeout{Local file profdefaut.cfg used}}{}}   
% ––––––––––––––––––––––––  AtEndDocument –––––––––––––––––––––––––––––––––––>

%<–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––>

%<–––––––––––––––––––––––––Gestion des  pénalités –––––––––––––––––––––––––––>
\@lowpenalty   51%
\@medpenalty  151%
\@highpenalty 301%
\relpenalty 10000%
\binoppenalty 10000%

%<–––––––––––––––––––––  En-tête et pied de page ––––––––––––––––––––––––––––>

\pagenumbering{arabic}

%\gdef \not@defined {???}

\define@cmdkey[PF]{param}{Classe}{}
\define@cmdkey[PF]{param}{TypeDevoir}{}
\define@cmdkey[PF]{param}{Temps}{}
\presetkeys[PF]{param}{Classe     = ???,%
                       TypeDevoir = ???,%
                       Temps      = ???}{}

\newcommand{\param}[1][]{\prof@param[#1]}%
\def\prof@param[#1]{%
\setkeys[PF]{param}{#1}%
\let \@class = \cmdPF@param@Classe%
\let \@typedev = \cmdPF@param@TypeDevoir%
\let \@temps = \cmdPF@param@Temps%
}

\newcommand*{\quand}{%
\ifcase\month
        \or janvier \or f\'evrier \or mars \or avril \or mai \or juin
        \or juillet \or ao\^ut \or septembre \or octobre \or novembre
        \or d\'ecembre
\fi%
\space\number\year%
}

\pagestyle{fancy}
\fancyhf{}

\let\headrulewidth\myheadrulewidth
\let\footrulewidth\myfootrulewidth
\let\headrule\myheadrule
 
\if@twoside%option twoside

% –––––––< twoside entêtes >––––––––
%
\fancyhead[LE]{}
\fancyhead[CE]{\ifx\@class\@empty \else \@class \fi}
\fancyhead[RE]{}

\fancyhead[LO]{\@discipline \ \ifx\@typedev\@empty \else \@typedev \fi}
\fancyhead[CO]{\ifx\@class\@empty \else \@class \fi}
\fancyhead[RO]{\if@nodate  \else  \@when \fi%
               \ifx\@temps\@empty \else  \@time\fi}
%
%<–––––––––––––––––––––––––––< twoside entête >––––––––––––––––––––––––––––––>
%
\fancyfoot[LE]{}
\fancyfoot[CE]{\@lycee}
\fancyfoot[LE]{\@page}
\fancyfoot[RE]{}
%
\fancyfoot[LO]{\@auteur}
\fancyfoot[CO]{\@lycee}
\fancyfoot[RO]{\@page}%
%
 \else % option oneside
%<–––––––––––––––––––––––––––< oneside entête >––––––––––––––––––––––––––––––>
\lhead{\@discipline \ \ifx\@typedev\@empty \else \@typedev \fi}
\chead{\ifx\@class\@empty \else \@class \fi }
\rhead{
\if@nodate  \else  \@when \fi
\ifx\@temps\@empty \else  \@time
 \fi
}

%<–––––––––––––––––––––––< oneside pied >––––––––––––––––––––––––––––––––––––>
\lfoot{\@auteur}
\cfoot{\@lycee}
\rfoot{\@page}%
\fi% fin de oneside
% 
%<––––––––––––< Numérotation des exercices et des parties >––––––––––––––––––>
%
\newcounter{exo}\setcounter{exo}{0}
\newcounter{part}[exo]\setcounter{part}{0}
%
\renewcommand*{\theexo}{\Roman{exo}}
\renewcommand*{\thepart}{\Alph{part}}

%<––––––––––––––––––––––< points attribués aux questions >–––––––––––––––––––>
\newcommand*{\@points}[1]{%
\ifthenelse%
{\equal{#1}{}}%
{}%
{\hfill\textsl{(#1 points)}}%
}

\define@cmdkey[PF]{exo}{label}{}
\define@cmdkey[PF]{exo}{point}{}
\define@cmdkey[PF]{exo}{style}{}
\define@cmdkey[PF]{exo}{space}{}
\define@boolkey[PF]{exo}{nonum}[true]{}
\presetkeys[PF]{exo}{label = Exercice,%
                     point = {},%
                     space = 1em,%
                     style = \arabic,%
                     nonum = false}{}
\newcommand{\exo}{\setcounter{part}{0}\@ifstar
                     \exoStar%
                     \exoNoStar%
}
\newcommand{\exoNoStar}[1][]{\prof@exo[#1]}%
\def\prof@exo[#1]{%
\@ifnextchar\bgroup
{\prof@@exo[#1]}
{\prof@@exo[#1]{}}}

\def\prof@@exo[#1]#2{%
\setkeys[PF]{exo}{#1}%
\before@exo
\ifPF@exo@nonum \else \stepcounter{exo} \fi%
{\textbf{\cmdPF@exo@label \ifPF@exo@nonum \else \ \no \fi}%
\ifPF@exo@nonum \else \makebox[\cmdPF@exo@space]{\hfil\textbf{\cmdPF@exo@style{exo}}} \fi}%
\hspace*{1em}#2
\ifthenelse{\equal{\cmdPF@exo@point}{}}{}{\@points{\cmdPF@exo@point}}
\after@exo} 

\newcommand{\exoStar}[1][]{\prof@exoStar[#1]}%
\def\prof@exoStar[#1]{%
\@ifnextchar\bgroup
{\prof@@exoStar[#1]}
{\prof@@exoStar[#1]{}}}

\def\prof@@exoStar[#1]#2{%
\setkeys[PF]{exo}{#1}%
\before@exo
{\textbf{\cmdPF@exo@label \ifPF@exo@nonum \else \ \no \fi}%
\ifPF@exo@nonum \else \makebox[\cmdPF@exo@space]{\hfil\textbf{\cmdPF@exo@style{exo}}} \fi}%
\hspace*{1em}#2
\ifthenelse{\equal{\cmdPF@exo@point}{}}{}{\@points{\cmdPF@exo@point}}
\after@exo} 


\newcommand*\part[1][]{\before@part{\stepcounter{part}\textbf{Partie\ \thepart}\hspace{12pt}\textsl{#1}}\after@part} 

%<–––––––––––––––––––––––– sections–––––––––––––––––––––––––––––––––––––––––>
\setcounter{secnumdepth}{3}

\newcounter {section}
\newcounter {subsection}[section]
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\Large\bfseries}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\large\bfseries}}

%<–––––––––––––< Création de listes d'exos : tous les fichiers >–––––––––––––>
%
\newcounter{max}
\newcounter{number}

\newcommand*{\InputAllExercise}[3]{%
% #1 chemin & #2 theme & #3 nbre d'exos
\setcounter{max}{#3}
\stepcounter{max}% 
\setcounter{number}{1}%
\whiledo{\value{number}<\value{max}}{%
   \InputIfFileExists{#1#2_\thenumber}{\exo}%
{\typeout{exercice #1#2_\thenumber\ absent.}}%
   \stepcounter{number}}%
}%

% #1 nbre de colonnes 1 ou 2 #2 chemin & #3 theme & #4 nbre d'exos
\newcommand*{\ttexos}[4]{%
\ifnum #1=\tw@%
\setlength\columnseprule{0.4pt}% 
\setlength\columnsep{10\p@}  
\begin{multicols}{2}%
    %\setcounter{unbalance}{10}%
    \InputAllExercise{#2}{#3}{#4}%
\end{multicols}
\else
    \InputAllExercise{#2}{#3}{#4}%
\fi%
}%
%
%<–––––––––––––––< Création de listes d'exos : choix de qlq exos >–––––––––––>
%
\newcommand*{\InputExerciseList}[3]{%
% #1 chemin & #2 theme & #3 liste de numéros
    \@for \@mynumber :=#3 \do {%
      \InputIfFileExists{#1#2_\@mynumber}{\exo}% si draft (\@mynumber)
            {\typeout{exercice #1#2_\@mynumber\ absent.}}%
    }%
}

% #1 nbre de colonnes 1 ou 2 #2 chemin & #3 theme & #4 liste de numéros
\newcommand*{\qlqexos}[4]{%
\ifnum #1=\tw@%
\setlength\columnseprule{0.4pt}%
\setlength\columnsep{10\p@}

\begin{multicols}{2}%
    %\setcounter{unbalance}{10}%
    \InputExerciseList{#2}{#3}{#4}%
\end{multicols}
\else
    \InputExerciseList{#2}{#3}{#4}%
\fi%
}%
%<––––––––––––––––––––––< Appel de tkz-bbpage.sty>–––––––––––––––––––––––––––>

\if@bbpage \RequirePackage{tkz-bbpage}\fi

%<–––––––––––––––––––< Modification des vecteurs >–––––––––––––––––––––––––––>
%
\DeclareRobustCommand*{\vec}[1]{\overrightarrow{\rule{0em}{1.2ex}#1\rule{0.15em}{0ex}}}
%
%<–––––––––––––––––––––< Ligne séparatrice ––––––––––––––––––––––––––––––––––>
%
\newcommand*{\sep}{\vspace{12pt}\hrule height 0.4pt width\textwidth \vspace{12pt}}
%
%<––––––––––––––––––––––< Figures, flottants et Tables >–––––––––––––––––––––>
%
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}
\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}

\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––=  AtBeginDocument 
% incomplet   il faut commenter

\AtBeginDocument{%
\setlength{\parindent}{0 pt}
\setlength{\parskip}{6 pt}  
%traitement des listes
\renewcommand*{\labelitemiii}{\textasteriskbullet}
\renewcommand*{\labelitemi}{\textbullet}
\renewcommand*{\labelitemii}{\textasteriskcentered}
\newcommand*{\labelenumi}{\textbf{\arabic{enumi}/}}%
\newcommand*{\labelenumii}{\textbf{\alph{enumii}/}}%

\setlength\leftmargini{1.em}
\leftmargin\leftmargini
\setlength\leftmarginii{1.2em}
\setlength\leftmarginiii{0.8em}
\setlength\leftmarginiv{0.8em}
 
\def\enumerate{%
   \ifnum \@enumdepth >3 \@toodeep
   \else
   \advance\@enumdepth \@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}
    \list{\csname label\@enumctr\endcsname}%
      {%
      \usecounter{\@enumctr}\parsep=0pt\leftmargin=1.8em%
      \labelsep=2pt%
      \labelwidth=\leftmargin%
      \advance\labelwidth-\labelsep%
      \topsep=0pt plus2pt minus2pt
      \partopsep=0pt%
      \parsep=2pt plus1pt minus1pt%
      \itemsep=0pt
      \def\makelabel##1{\hbox to\labelwidth{##1\hss}}%
      }%
    \fi}

\def\itemize{%
    \ifnum \@itemdepth >3 \@toodeep
    \else
        \advance\@itemdepth \@ne
        \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}
        \list{\csname \@itemitem\endcsname}%
        {%
        \parsep=0pt
        \leftmargin=10pt
        \labelsep=2pt
        \labelwidth=\leftmargin
        \advance\labelwidth-\labelsep
        \topsep=0pt plus2pt minus2pt
        \partopsep=0pt
        \itemsep=0pt
        \def\makelabel##1{\hbox to\labelwidth{##1\hss}}%
        }%
    \fi}

\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}


\DecimalMathComma
\AddThinSpaceBeforeFootnotes
%\NoAutoSpaceBeforeFDP
\frenchspacing
\FrenchListSpacingtrue
\FrenchItemizeSpacingtrue
\FrenchFootnotes 
\AddThinSpaceBeforeFootnotes% (« 1. Note »)
\ThinSpaceInFrenchNumbers% espace fine% 
\StandardLayout%   mise en page originale de LaTeX
\parskip0pt
}% fin de atbegindoc 

%<–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––>
\endinput
%<–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––>


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %                                                               %
    %          End of file `prof.cls'. v 1.00  05/01/2007           %
    %                                                               %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
