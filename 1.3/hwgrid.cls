%% Homework Grid class - version 1.3
% Last updated 2019-09-03

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
\ProvidesClass{hwgrid}[2019/09/03 (v1.3) Homework Grid class]
\LoadClass{article}

\RequirePackage[letterpaper,margin=1in,landscape]{geometry}
% https://tex.stackexchange.com/a/147507/
\RequirePackage{tabularx,booktabs}
% https://en.wikibooks.org/w/index.php?title=LaTeX/Tables&stableid=3532613

\RequirePackage{xparse}

\ExplSyntaxOn
% http://www.texdoc.net/texmf-dist/doc/latex/l3kernel/interface3.pdf
% https://mirror.las.iastate.edu/tex-archive/macros/latex/contrib/l3packages/xparse.pdf

\NewExpandableDocumentCommand \repeatcommand {O{}mm} {
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

\NewExpandableDocumentCommand \includelist {O{}m} {
  % #1: delimiter
  % #2: name of list to include
  \clist_use:cn {l_my_ #2 _clist} {#1}
}

% https://tex.stackexchange.com/a/382779/
% https://tex.stackexchange.com/a/422960/

\NewDocumentCommand \sizeoflist {m} {
  % #1: name of list
  \clist_count:c {l_my_ #1 _clist}
}

\global\let\rowmac\relax

\NewDocumentCommand \clearrow {} {
  \global\let\rowmac\relax
}

\NewDocumentCommand \setrow {m} {
  % #1: command to apply to row
  \gdef \rowmac {#1}
  #1 \ignorespaces
}

% https://tex.stackexchange.com/a/309837/

\NewDocumentCommand \insertgrid {mmomo} {
  % #1: comma-delimited list of days of the week
  % #2: comma-delimited list of dates (same length as #1)
  % #3: comma-delimited list of events corresponding to each day
  %     (same length as #1 and #2)
  % #4: comma-delimited list of classes
  % #5: Height of rows for classes

  \makelist{days}{#1}
  \makelist{dates}{#2}
  \IfValueTF {#3}
    {\makelist{events}{#3}}
    {\makelist{events}{\repeatcommand[,]{\sizeoflist{days}}{~}}}
  \makelist{classes}{#4}
  
  \vspace{0.5cm}
  \begin{tabularx}
    {\textwidth}{ >{\bfseries}X *{\sizeoflist{days}}{|>{\rowmac\centering\arraybackslash}X} }

    \setrow{\bfseries} & \includelist[&]{days} \clearrow\\

    & \includelist[&]{dates} \\
    \setrow{\small\scshape} & \includelist[&]{events} \\\midrule

    \raggedright \includelist[
      \repeatcommand{\sizeoflist{days}}{&}
      \IfValueTF {#5} {\\[#5]} {\\} \midrule
      \raggedright
    ]{classes}
    \repeatcommand{\sizeoflist{days}}{&}
    \IfValueTF {#5} {\\[#5]} {\\}

  \end{tabularx}
}

\ExplSyntaxOff

\AtBeginDocument{\thispagestyle{empty}}

\endinput
