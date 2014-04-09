%% `ETHclass.cls'
%% Copyright 2011 by
%  Prof. Dr. Dr. Frank Schweitzer,
%  Dr. Antonios Garas,
%  Alexander Grimm,
%  Chair of Systems Design, ETH Zurich
%  Kreuzplatz 5, CH-8032 Zurich
%
%
% This class can be redistributed and/or modified under the terms
% of the GNU Public License, version 2.
% For the context of the licence, program shall refer to all source
% files distributed with this stylefile. Note that this does not refer
% to your documents.

% This is a style file for creating LaTeX beamer presentations
% in the ETH wide corporate design.
%
% The following options can be used when including the package:
%
%   totalframes  prints the total number of frames
%   first        uses special first frame
%   firstalt     uses special first frame (alternative version)
%   last         uses special last frame
%   firstsupp    suppresses footer on first frame
%   lastsupp     suppresses footer on last frame
%   navigation   displays navigation symbols
%
% New background (blue)
%%
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ETHclass}[2010/12/30 v0.5]

%% --- Declaration of options ---
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}

%% --- Execution of options ---
\ProcessOptions
\LoadClass{beamer}

\RequirePackage{ifthen}
\RequirePackage{layouts}

%%% Total page settings
% \voffset = 0pt
% \topmargin=0pt
% \headheight=0pt
% \setbeamersize{text margin left=40pt,text margin right=4pt}

%%% Modified Itemizing
\usepackage{amsfonts} % Package used for Item symbols
\setlength{\leftmargini}{1.75pt} % indention of item order 1
\setlength{\leftmarginii}{16pt} % indention of item order 2
\setlength{\leftmarginiii}{16pt} % indention of item order 3
\setlength{\labelsep}{10pt} %% Separation page to item

%% Size of items
\def\Tiny{\fontsize{4.25pt}{4.25pt}\selectfont}

%% Itemizing Symbol: Square
\setbeamertemplate{itemize items}[square]

%% Position and Size of items in all three orders
\useitemizeitemtemplate{%
    \Tiny\raise3.75pt\hbox{\color{itemblue}$\blacksquare$}%
}
\usesubitemizeitemtemplate{%
    \Tiny\raise2.5pt\hbox{\color{itemblue}$\blacksquare$}%
}
\usesubsubitemizeitemtemplate{%
    \Tiny\raise2.5pt\hbox{\color{itemblue}$\blacksquare$}%
}

\def\@advisors{}
\newcommand{\advisors}[1]{\def\@advisors{#1}}
\def\@department{}
\newcommand{\department}[1]{\def\@department{#1}}

%% Titlepage
\newcommand{\totalframes}{}
\newcommand{\normalbg}{\includegraphics[width=\paperwidth,page=3]{ETHbackground}}
\newcommand{\firstbg}{\normalbg}
\newcommand{\lastbg}{\includegraphics[width=\paperwidth,page=4]{ETHbackground}}

%% Position of date / institute / framenumber
\newcommand{\normalfooter}{%
\leavevmode%
  \hbox{
    \begin{beamercolorbox}[wd=.25\paperwidth,ht=2.5ex,dp=1.125ex,left]{author in head/foot}%
%      \qquad\color{white}{\insertdate}%
    \end{beamercolorbox}%

    \begin{beamercolorbox}[wd=.5\paperwidth,ht=2.5ex,dp=1.125ex,center]{title in head/foot}%
%      \color{white}{\insertinstitute}%
    \end{beamercolorbox}%

    \begin{beamercolorbox}[wd=.2\paperwidth,ht=2.5ex,dp=1.125ex,right]{title in head/foot}%
      \color{white}{\insertframenumber\totalframes}%
    \end{beamercolorbox}%
  }}
\newcommand{\firstfooter}{\normalfooter}
\newcommand{\lastfooter}{\normalfooter}
\newcommand{\navsymb}{\setbeamertemplate{navigation symbols}{}}
\newcommand{\usespecialtitlepagetemplate}{
\makeatletter
\setbeamertemplate{title page}%{default}[1][]
{
  \vspace{25.5pt}
  \vskip5em
  \begin{beamercolorbox}[wd=0.99\paperwidth,ht=3.8ex,dp=1ex,sep=1.7ex,left,shadow=true]{title}
  \vskip0.2em
    \usebeamerfont{title}
 {\fontsize{13.9pt}{8pt}\textbf{\inserttitle}\par}
  \ifx\insertsubtitle\@empty%
    \else%
      \vskip0.5em%
      {\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par}%
    \fi%
   \end{beamercolorbox}%
  \vskip0.5em\par
  \vspace{20pt}
   {\usebeamercolor[fg]{titlegraphic}\inserttitlegraphic\par}

   \begin{beamercolorbox}[wd=9.17in,ht=1ex,dp=1ex,sep=2.7ex,left,shadow=true]{author}
    {\fontsize{9}{4pt}\usebeamerfont{author}{\insertauthor}}
   \end{beamercolorbox}

  \vskip7em
   \begin{beamercolorbox}[wd=9.17in,ht=1ex,dp=1ex,sep=2.7ex,left,shadow=true]{institute}
     {\fontsize{9pt}{4pt}\usebeamerfont{author}{\@advisors\par}}
   \end{beamercolorbox}

   \begin{beamercolorbox}[wd=9.17in,ht=1ex,dp=1ex,sep=2.7ex,left,shadow=true]{institute}
     {\fontsize{9pt}{4pt}\usebeamerfont{author}{\@department, ETH Z\"urich}}
   \end{beamercolorbox}
  %\vskip0.5em\par
   % \begin{beamercolorbox}[wd=9.17in,ht=1ex,dp=1ex,sep=2.7ex,left,shadow=true]{date}
   %   {\fontsize{12pt}{4pt}\usebeamerfont{author}{\insertdate}}
%   \end{beamercolorbox}
\vskip1.5em
\vfill
}
\makeatother
}

%% Handout option
\DeclareOption{handout}{\gdef\beamer@currentmode{handout}}

%% Information floor
\DeclareOption{totalframes}{\renewcommand{\totalframes}{/\inserttotalframenumber}}
\DeclareOption{last}{\renewcommand{\lastbg}{\includegraphics[width=\paperwidth,page=4]{ETHbackground}}}
\DeclareOption{first}{
  \renewcommand{\firstbg}{\includegraphics[width=\paperwidth,page=1]{ETHbackground}}
  \usespecialtitlepagetemplate
}
\DeclareOption{firstalt}{
  \renewcommand{\firstbg}{\includegraphics[width=\paperwidth,page=2]{ETHbackground}}
  \usespecialtitlepagetemplate
}

\DeclareOption{firstsupp}{\renewcommand{\firstfooter}{}}
\DeclareOption{lastsupp}{\renewcommand{\lastfooter}{}}

% execute options
\ProcessOptions

\setbeamertemplate{footline}
{%
\ifthenelse{\equal{\insertframenumber}{1}}{%
    \firstfooter%
  }{%
    \ifthenelse{\equal{\insertframenumber}{\inserttotalframenumber}}{%
      \lastfooter%
    }{%
      \normalfooter%
    }
  }
}

%%% Frametitle position each slide
\setbeamertemplate{frametitle}
{
\vspace{38pt}
    \begin{beamercolorbox}[wd=.99\paperwidth,ht=3.8ex,dp=1ex,sep=1.8ex,left,shadow=true]{frametitle}%
    {\fontsize{13.9pt}{8pt}\textbf{\insertframetitle}\par}
    \end{beamercolorbox}%
\vspace{-14pt}
}

\usebackgroundtemplate{
  \ifthenelse{\equal{\insertframenumber}{1}}{%
%    \firstbg%
  }{%
    \ifthenelse{\equal{\insertframenumber}{\inserttotalframenumber}}{%
      \normalbg
%      \lastbg%
    }{%
      \normalbg%
    }
  }
}

%%% Notes
%\mode<notes>

\mode<presentation>
{
  \useoutertheme{default}    % empty
%  \useoutertheme{infolines} % simple but bland
%  \useoutertheme{split}     % ok if compress option used
%  \useoutertheme{shadow}    % way too much space used -- ok with option 'compress'
  %\useoutertheme{shadow}
  %\setbeamercovered{transparent} % or whatever (possibly just delete it)
  %\useoutertheme[subsection=false]{miniframes}
}

%%%%%%%%%%%%%%%%
% With ETH fonts
%%%%%%%%%%%%%%%%


% Use the following lines if the fonts ETH-Light are installed
% for LaTeX (Frank Schweitzer, Robert mach 2004-12-13)
% \renewcommand{\familydefault}{let}
% \renewcommand{\sfdefault}{let}
%
% \DeclareFixedFont{\x}{T1}{let}{m}{n}{10}
% \DeclareFixedFont{\xb}{T1}{let}{b}{n}{10}
% \newfont{\xiiiv}{letr8t at 8.5pt}
% \newfont{\xiiivb}{letb8t at 8.5pt}


%%%%%%%%%%%%%%%%%
% With Helvetica fonts
%%%%%%%%%%%%%%%%

% Use the following lines if helvetica fonts should be used
% Frank Schweitzer, Robert Mach 2004-12-13
\renewcommand{\familydefault}{phv}
\renewcommand{\sfdefault}{phv}
%\renewcommand{\normalsize}{\fontsize{10.5pt}{12.5pt}\xiiiv}

\DeclareFixedFont{\x}{T1}{phv}{m}{n}{10}
\DeclareFixedFont{\xb}{T1}{phv}{b}{n}{10}
\newfont{\xiiiv}{phvr8t at 30pt}
\newfont{\xiiivb}{phvb8t at 8.5pt}

% Color definitions
\usecolortheme[RGB={0,43,94}]{structure}
\definecolor{blue}{RGB}{0,43,94}
\definecolor{black}{RGB}{0,0,0}
\definecolor{white}{RGB}{255,255,255}
\definecolor{red}{RGB}{161,80,0}
\definecolor{itemblue}{RGB}{0,80,145} %% Color of item squares (different
                                %% blue)

\setbeamercolor{block title}{use=blue,fg=blue.fg,bg=blue.fg!20!bg}
\setbeamercolor{block title alerted}{use=alerted text,fg=alerted text.fg,bg=alerted text.fg!20!bg}
\setbeamercolor{block title example}{use=example text,fg=example text.fg,bg=example text.fg!20!bg}

\setbeamercolor{block body}{parent=normal text,use=block title,bg=block title.bg!50!bg}
\setbeamercolor{block body alerted}{parent=normal text,use=block title alerted}
\setbeamercolor{block body example}{parent=normal text,use=block title example}

\setbeamercolor{normal text}{fg=black,bg=white}
\setbeamercolor{alerted text}{fg=red}

%%
%% End of file