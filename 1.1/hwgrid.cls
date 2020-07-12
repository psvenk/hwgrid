%% Homework Grid class - version 1.1
% Last updated 2019-09-02

% Copyright (c) 2019 psvenk

% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hwgrid}[2019/09/02 (v1.1) Homework Grid class]
\LoadClass{article}

\RequirePackage[letterpaper,margin=1in,landscape]{geometry}
% https://tex.stackexchange.com/a/147507/
\RequirePackage{tabularx,booktabs}
% https://en.wikibooks.org/w/index.php?title=LaTeX/Tables&stableid=3532613

\RequirePackage{xparse}

\ExplSyntaxOn
\DeclareExpandableDocumentCommand \repeatcommand {O{}mm} {
  % #1: delimiter
  % #2: number of times to repeat command
  % #3: command to repeat
  \int_compare:nT {#2 > 0} {
    #3 \prg_replicate:nn {#2 - 1} {#1 #3}
  }
}
% https://tex.stackexchange.com/a/300215/

\NewDocumentCommand \makelist {mm} {
  % #1: name of list
  % #2: contents of list (comma-delimited)
  \clist_new:c {l_my_ #1 _clist}
  \clist_set:cn {l_my_ #1 _clist} {#2}
}

\DeclareExpandableDocumentCommand \includelist {O{}m} {
  % #1: delimiter
  % #2: name of list to include
  \clist_use:cn {l_my_ #2 _clist} {#1}
}

% https://tex.stackexchange.com/a/382779/
% https://tex.stackexchange.com/a/422960/

\NewDocumentCommand \sizeoflist {m} {
  % #2: name of list
  \clist_count:c {l_my_ #1 _clist}
}

\ExplSyntaxOff
% http://www.texdoc.net/texmf-dist/doc/latex/l3kernel/interface3.pdf
% https://mirror.las.iastate.edu/tex-archive/macros/latex/contrib/l3packages/xparse.pdf

\newcommand\setrow[1]{\gdef\rowmac{#1}#1\ignorespaces}
\newcommand\clearrow{\global\let\rowmac\relax}
\clearrow
% https://tex.stackexchange.com/a/309837/

\AtBeginDocument{\thispagestyle{empty}}

\newcommand{\insertgrid}[4]{%
  \makelist{days}{#1}
  \makelist{dates}{#2}
  \makelist{events}{#3}
  \makelist{classes}{#4}
  
  \vspace{0.5cm}
  \begin{tabularx}
    {\textwidth}{ >{\bfseries}X *{\sizeoflist{days}}{|>{\rowmac\centering\arraybackslash}X} }

    \setrow{\bfseries} & \includelist[&]{days} \clearrow\\

    & \includelist[&]{dates} \\
    \setrow{\small\scshape} & \includelist[&]{events} \\\midrule

    \raggedright \includelist[\repeatcommand{\sizeoflist{days}}{&} \\\midrule \raggedright]{classes} \repeatcommand{\sizeoflist{days}}{&} \\

  \end{tabularx}
}

% Fix height of rows for classes at a specified value (#5)
\newcommand{\insertgridfixed}[5]{%
  \makelist{days}{#1}
  \makelist{dates}{#2}
  \makelist{events}{#3}
  \makelist{classes}{#4}
  
  \vspace{0.5cm}
  \begin{tabularx}
    {\textwidth}{ >{\bfseries}X *{\sizeoflist{days}}{|>{\rowmac\centering\arraybackslash}X} }

    \setrow{\bfseries} & \includelist[&]{days} \clearrow\\

    & \includelist[&]{dates} \\
    \setrow{\small\scshape} & \includelist[&]{events} \\\midrule
    
    \raggedright \includelist[\repeatcommand{\sizeoflist{days}}{&} \\[#5]\midrule \raggedright]{classes} \repeatcommand{\sizeoflist{days}}{&} \\[#5]

  \end{tabularx}
}  

\endinput
