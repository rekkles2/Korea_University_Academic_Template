%%%%%%%%%
%
% Korea University adaptation of the Yale arXiv demo class.
% Based on the UC Berkeley RAIL / DeepMind-derived original class.
% Original license attribution is preserved below.
% Style file used by UC Berkeley RAIL folks.
% This is an edited version of the Google DeepMind tech report template, used under CC Licence, obtained from tex sources of Google DeepMind arxiv papers. There are several changes including font sizes, abstract formatting, title formatting, figure formatting, colors, and math fonts which are allowed per the license.
% 
%
% Use it in the following way, with the full set of option possible:
% \documentclass[11pt, a4paper, twocolumn, logo, copyright, nonumbering, 
% internal]{kuarxiv} 
%
% Options:
%    - 11pt: Sets the normal font size of the text. Can be only 10, 11, 12pt.
%    - a4paper: Paper size. Usually would not adjust.
%    - twocolumn: Makes the paper into two column mode; single column by default.
%    - logo: Adds the KU logo beside author metadata below the abstract. No logo included if left out.
%    - copyright: Add a copyright statement to the first page of the paper in the left footnote
%    - nonumbering: Uses unnumbered sections.
%    - internal: for internal only docs that should not be shared externally. 
%           Can only use techreportnumber with this option.
%
% Paper URL: optional first-page header uses the existing \paperurl token.
% The frontmatter does not impose a document type or publication date.
%
% Confidentiality
%   Change the confidentiality statement for internal docs by adding this in the preable 
%   \renewcommand{\internal}{Confidential.}
%   
% ----------------
% Licence: This template is released under the Creative Commons licence 
% Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)
%
%
% Known issues:
%   - Two-column full-width frontmatter must fit on one page.
%
% Version history: 
% v0.1 - Jan 2024: Obtained from arxiv papers
% v0.2 - Feb 2024: revised some details
% %%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{kuarxiv}[2026/10/25 Korea University academic report]
\RequirePackage{iftex}
\ifPDFTeX\pdfminorversion=7\fi

% Palatino font %%%%---- to switch to computer modern font, comment next three lines, and line 126
\RequirePackage{mathpazo}  % math & text



%%======== Pckage options and base class ========
% \RequirePackage{tcolorbox}
\RequirePackage{xifthen}
\newboolean{nonumbering}
\newboolean{logo}
\newboolean{address}
\newboolean{copyright}
\newboolean{internal}
\DeclareOption{nonumbering}{\setboolean{nonumbering}{true}}
\DeclareOption{logo}{\setboolean{logo}{true}}
\DeclareOption{address}{\setboolean{address}{true}}
\DeclareOption{copyright}{\setboolean{copyright}{true}}
\DeclareOption{internal}{\setboolean{internal}{true}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions
\LoadClass{extarticle}

%%======== Packages Required ========
% Fonts and language
\AtEndOfClass{\RequirePackage[tracking=smallcaps]{microtype}}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english]{babel}
\RequirePackage{amsthm, amsmath, amsfonts, amssymb}
\RequirePackage{cmap}
\RequirePackage[T1]{fontenc}
\RequirePackage{url}
\RequirePackage{pifont}
\RequirePackage{textcomp} % For copyright symbol styling
\RequirePackage[overload]{textcase}
%\RequirePackage{balance}
%% *Graphics, tables and other formatting
\RequirePackage{graphicx}
\RequirePackage[svgnames,table]{xcolor}
\RequirePackage{colortbl}

\RequirePackage{booktabs}
\RequirePackage{changepage}
\RequirePackage{enumitem} % For reducing bullet list item separation
\RequirePackage{tabularx}
\RequirePackage{datetime}
% Headers and footers
\RequirePackage{fancyhdr}  % custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
% Lists and their spacing
\setlist[itemize]{noitemsep}
\setlist[enumerate]{noitemsep}
% % Title, Abstract, Bibliography
\RequirePackage[explicit]{titlesec}
\RequirePackage{bibentry}
\RequirePackage{mdframed}
\RequirePackage{caption}
\RequirePackage{needspace}
\RequirePackage{listings}
\RequirePackage[most]{tcolorbox}

\RequirePackage{placeins}
\RequirePackage{hyphenat}
\RequirePackage{setspace}
\RequirePackage{parskip}
\RequirePackage{etoolbox}
\RequirePackage{lipsum}

\definecolor{KUCrimson}{HTML}{862633} % Approximate screen match for KU Pantone 202 C
\definecolor{KUDarkCrimson}{HTML}{641B2C}
% Companion accents: the official title/logo anchor remains KUCrimson.
\definecolor{KUCitation}{HTML}{B51F3F}
\definecolor{KULink}{HTML}{A62A46}
\definecolor{KUHeader}{HTML}{3A2026}
\definecolor{KURule}{HTML}{B51F3F}
\definecolor{KUShadow}{HTML}{6C3B47}
% \definecolor{YaleBlue}{RGB}{0,58,112}
% \RequirePackage[svgnames]{xcolor}
% \RequirePackage[dvipsnames]{xcolor}
% \definecolor{Crimson}{HTML}{990000}
\definecolor{Black}{HTML}{000000}
% \definecolor{CalGoldHex}{HTML}{FFF5E1}
\definecolor{IronGrey}{HTML}{6D6E71}
\definecolor{infinifg}{HTML}{1C2B33}
\definecolor{KULightBackground}{HTML}{F7F7F7}

\RequirePackage[colorlinks=true,linkcolor=KULink,citecolor=KUCitation,urlcolor=KULink,pagebackref,breaklinks]{hyperref}

%%======== Can use any of these fonts ========
% \RequirePackage{charter}
% \RequirePackage[scaled]{helvet}
% \RequirePackage{bookman}
% \RequirePackage{times}
% \RequirePackage[default]{opensans} %fosfamily
%\usepackage{antpolt}
% Math fonts
% \RequirePackage{mathpazo} % Palatino
%\usepackage{euler} % for math fints

% Use Bitstream Charter as the main font. Does not include a typewriter font.
\RequirePackage{XCharter} %%%%---- to switch to computer modern font, comment this line, and lines 47-49
% \RequirePackage[xcharter,bigdelims,vvarbb]{newtxmath}
% \RequirePackage{libertine}
% \RequirePackage{libertinust1math}
% \RequirePackage[p]{zlmtt} % for teletype, lmodern's typewriter font


% Use the typewriter font from lmodern, scaled up to match Charter's xheight.
% You may wish to add the "p" option to use the proportional font instead of
% the monospaced one, which might look nicer in cases where you do not need
% aligned columns
\RequirePackage[scaled=1.1]{zlmtt}
% \RequirePackage{libertine}
% \RequirePackage{libertinust1math}

%%======== Margins and column spacing ========
\RequirePackage[left=2.25cm,%
right=2.5cm,%
top=2.2cm,%
bottom=2.5cm,%
headheight=18pt,%
headsep=13pt,%
%showframe, % for testing
]{geometry}%
\setlength{\columnsep}{15pt} % Distance between the two columns of text
%\setlength{\parindent}{0pt}
\setlength{\parskip}{0.5\baselineskip}

%% *Custom font sizes and styles
\newcommand{\watermarkfont}{\color{black50}\normalfont\fontsize{10}{12}\selectfont}
\newcommand{\headerfont}{\normalfont\bfseries\color{KUHeader}\fontsize{10.5}{13}\selectfont}
\newcommand{\titlefont}{\centering\color{KUCrimson}\normalfont\bfseries\fontsize{18}{20}\selectfont} %%%%---- title font/color
%\newcommand{\titlefont}{\centering\color{Black}\normalfont\bfseries\fontsize{21}{23}\selectfont} %%%%---- title font/color
\newcommand{\datesfont}{\normalfont\sffamily\itshape\fontsize{8}{10}\selectfont}
\newcommand\urlheaderfont{\color{Black}\fontsize{8}{10}\selectfont}
\newcommand{\absfont}{\linespread{1.1}\fontsize{10}{12}\color{black}\selectfont}
\newcommand{\keywordstitlefont}{\bfseries\linespread{1.2}\fontsize{8}{10}\selectfont}
\newcommand{\keywordsfont}{\itshape\linespread{1.2}\fontsize{11}{12}\selectfont}
\newcommand{\copyrightfont}{\normalfont\fontsize{7}{9}\selectfont}
\newcommand{\footerfont}{\color{black}\normalfont\fontsize{8}{10}\selectfont}
\newcommand{\subjectfont}{\color{white}\bfseries\fontsize{10}{12}\selectfont}
% Section headings: Helvetica-compatible bold sans serif, inspired by the Meta reference.
\newcommand{\headingfont}{\normalfont\fontfamily{phv}\bfseries\color{Black}\fontsize{13}{16}\selectfont}

\newcommand{\keywords}[1]{\def\@keywords{#1}}
\newtoks\correspondingauthor
\newtoks\paperurl
\newtoks\reportnumber

% Dates and Times for footer
%\newdateformat{monthyeardate}{\THEDAY{ }\monthname[\THEMONTH] \THEYEAR}
% ISO-8601 date format
\newdateformat{monthyeardate}{\THEYEAR-\THEMONTH-\THEDAY}
\setcounter{secnumdepth}{3}
\ifthenelse{\boolean{nonumbering}}{\setcounter{secnumdepth}{0}}{}

%%========  Author and affiliation ========
\RequirePackage{authblk}
\setcounter{Maxaffil}{0}
\setlength{\affilsep}{0.2em}
\renewcommand\Authfont{\centering\normalfont\bfseries\fontsize{10}{16}\selectfont}
\renewcommand\Affilfont{\centering\normalfont\fontsize{10}{14}\selectfont}
\makeatletter
\renewcommand\AB@affilsepx{, \protect\Affilfont}
\makeatother
\renewcommand\Authands{, and }

\newcommand{\internalonly}{}
\newcommand{\copyrightext}{\footerfont \textcopyright\, \the\year{} }


%%======== Header and Footer Content ========
%
% Header and Footer for the first page
% Logo is intentionally not in the header; it appears below the abstract.
\pagestyle{fancy}   % Enables the custom headers/footers
\makeatletter
\fancypagestyle{firststyle}{%
  \fancyhead[L,C]{}%
  \fancyhead[R]{%
    \expandafter\ifstrempty\expandafter{\the\paperurl}{}%
      {{\urlheaderfont\itshape\href{\the\paperurl}{\the\paperurl}}}}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
  \fancyfoot[C]{}%
  \fancyfoot[L]{%
    \parbox[b]{.72\textwidth}{\raggedright\footerfont
      \setlength{\parskip}{0pt}%
      \expandafter\ifstrempty\expandafter{\the\correspondingauthor}{}%
        {{\itshape Corresponding author(s): \the\correspondingauthor\par}}%
      \ifthenelse{\boolean{internal}}{%
        \ifdefempty{\internalonly}{}{{\internalonly\par}}}{}%
      \ifthenelse{\boolean{address}}{%
        {\itshape Korea University, Seoul, Republic of Korea\par}}{}%
      \ifthenelse{\boolean{copyright}}{\copyrightext\par}{}%
    }}%
  \fancyfoot[R]{%
    \ifthenelse{\boolean{internal}}{%
      \expandafter\ifstrempty\expandafter{\the\reportnumber}{}%
        {{\footerfont\bfseries\the\reportnumber}}}{}}%
}
\makeatother

% Header and Footer for pages from 2 onwards
\renewcommand{\footrulewidth}{0pt}
\fancyhead[L,R]{}
\makeatletter
\newcommand\runningtitle[1]{\renewcommand\@runningtitle{#1}}
\newcommand\@runningtitle{}
\fancyhead[C]{\headerfont\strut \@runningtitle} %%%%---- Running title
\makeatother
\fancyfoot[C]{}
\fancyfoot[L]{%
  \ifthenelse{\boolean{internal}}{%
    \ifdefempty{\internalonly}{}%
      {\parbox[b]{.72\textwidth}{\raggedright\footerfont\internalonly}}}{}}
\fancyfoot[R]{\footerfont \thepage}

% Header and footer rules (coloured).
\renewcommand{\headrulewidth}{0.75pt}
% \renewcommand{\footrulewidth}{1pt}
\let\DefaultHeadRule\headrule
\let\DefaultFootRule\footrule
\renewcommand{\headrule}{{\color{KURule}\DefaultHeadRule}}
\renewcommand{\footrule}{\textcolor{black}{\DefaultFootRule}}

%%========  Bibliography using bibtex ========


\addto{\captionsenglish}{\renewcommand{\refname}{References}}
\newcommand{\citeas}[1]{\Needspace*{8\baselineskip}\noindent\bibentry{#1}}
% Uncomment the next line if you want the  numbered refs to be "1." instead of "[1]".
%\makeatletter \renewcommand\@biblabel[1]{#1.} \makeatother

%%======== Abstract and section formatting ========


% Frontmatter API: all document-specific values live in Metadata/.
\RequirePackage{xparse}
\definecolor{KUMetadata}{HTML}{444444}
\definecolor{KUSecondary}{HTML}{626262}
\RenewDocumentEnvironment{abstract}{+b}{\long\gdef\theabstract{#1}}{}
\providecommand{\theabstract}{}
\makeatletter
\def\KU@authors{}
\newcommand{\KU@separator}{}
\newcommand{\KU@symbol@equal}{*}
\newcommand{\KU@symbol@lead}{\textdaggerdbl}
\newcommand{\KU@symbol@corresponding}{\textdagger}
\newcommand{\KU@symbol@senior}{\textsection}
\newcommand{\KU@note@equal}{Equal contribution}
\newcommand{\KU@note@lead}{Project lead}
\newcommand{\KU@note@corresponding}{Corresponding author}
\newcommand{\KU@note@senior}{Joint senior author}
% Affiliation and email registries (expl3). Affiliation text may contain commas,
% so it is stored as token lists: a prop maps id to text, a seq keeps id order.
% Exact duplicates are dropped; one id with different text raises a ClassError.
% Author entries (KUAuthor) are not deduplicated.
\ExplSyntaxOn
\seq_new:N \g__ku_aff_ids_seq
\prop_new:N \g__ku_aff_text_prop
\seq_new:N \g__ku_email_seq
\tl_new:N \l__ku_aff_old_tl
\tl_new:N \l__ku_aff_new_tl
\tl_new:N \l__ku_sep_tl
\cs_new_protected:Nn \__ku_aff_add:nn
  {
    \prop_if_in:NnTF \g__ku_aff_text_prop {#1}
      {
        \prop_get:NnN \g__ku_aff_text_prop {#1} \l__ku_aff_old_tl
        \tl_set:Nn \l__ku_aff_new_tl {#2}
        \tl_if_eq:NNF \l__ku_aff_old_tl \l__ku_aff_new_tl
          {
            \ClassError{kuarxiv}
              {Affiliation~id~'#1'~has~conflicting~text}
              {Each~affiliation~id~may~be~registered~with~only~one~text.}
          }
      }
      {
        \prop_gput:Nnn \g__ku_aff_text_prop {#1} {#2}
        \seq_gput_right:Nn \g__ku_aff_ids_seq {#1}
      }
  }
\cs_new_protected:Nn \__ku_email_add:n
  {
    \tl_if_blank:nF {#1}
      { \seq_if_in:NnF \g__ku_email_seq {#1}
          { \seq_gput_right:Nn \g__ku_email_seq {#1} } }
  }
\cs_new_protected:Nn \__ku_aff_item:n
  { \textsuperscript{#1}\,\prop_item:Nn \g__ku_aff_text_prop {#1} }
\cs_new_protected:Nn \__ku_aff_print:
  {
    \seq_map_inline:Nn \g__ku_aff_ids_seq
      { \__ku_aff_item:n {##1}\par }
  }
\cs_new_protected:Nn \__ku_email_print:
  {
    \tl_clear:N \l__ku_sep_tl
    \seq_map_inline:Nn \g__ku_email_seq
      {
        \tl_use:N \l__ku_sep_tl
        \href{mailto:##1}{\nolinkurl{##1}}
        \tl_set:Nn \l__ku_sep_tl { \hspace{1em}\allowbreak }
      }
  }
\cs_new_protected:Nn \__ku_meta_print:
  {
    \seq_if_empty:NF \g__ku_aff_ids_seq
      { \__ku_aff_print: }
    \seq_if_empty:NF \g__ku_email_seq
      { \addvspace{4pt}\__ku_email_print:\par }
  }
% High-level data API: author/name, complete affiliation text(s), email.
% Unit ids are assigned and reused automatically; manual APIs remain valid.
\int_new:N \g__ku_auto_aff_int
\tl_new:N \l__ku_auto_aff_id_tl
\tl_new:N \l__ku_author_aff_ids_tl
\seq_new:N \l__ku_author_aff_seq
\cs_generate_variant:Nn \prop_if_in:NnTF { NV }
\cs_generate_variant:Nn \seq_if_in:NnF { NV }
\cs_generate_variant:Nn \__ku_aff_add:nn { Vn }
\cs_new_protected:Npn \__ku_next_aff_id:
  {
    \int_gincr:N \g__ku_auto_aff_int
    \tl_set:Nx \l__ku_auto_aff_id_tl { \int_use:N \g__ku_auto_aff_int }
    \prop_if_in:NVTF \g__ku_aff_text_prop \l__ku_auto_aff_id_tl
      { \__ku_next_aff_id: } { }
  }
\cs_new_protected:Npn \__ku_auto_aff_add:n #1
  {
    \tl_if_blank:nF {#1}
      {
        \tl_clear:N \l__ku_auto_aff_id_tl
        \prop_map_inline:Nn \g__ku_aff_text_prop
          {
            \tl_if_eq:nnT {##2} {#1}
              { \tl_set:Nn \l__ku_auto_aff_id_tl {##1} \prop_map_break: }
          }
        \tl_if_empty:NT \l__ku_auto_aff_id_tl
          { \__ku_next_aff_id: \__ku_aff_add:Vn \l__ku_auto_aff_id_tl {#1} }
        \seq_if_in:NVF \l__ku_author_aff_seq \l__ku_auto_aff_id_tl
          { \seq_put_right:NV \l__ku_author_aff_seq \l__ku_auto_aff_id_tl }
      }
  }
\cs_new_protected:Npn \__ku_finish_author:nnn #1#2#3
  {
    \tl_set:Nx \l__ku_author_aff_ids_tl { \seq_use:Nn \l__ku_author_aff_seq {,} }
    \exp_args:NnV \KUAuthor {#1} \l__ku_author_aff_ids_tl {#3}
    \__ku_email_add:n {#2}
  }
\NewDocumentCommand{\KUAddAuthor}{O{} m m m}
  {
    \seq_clear:N \l__ku_author_aff_seq
    \__ku_auto_aff_add:n {#3}
    \__ku_finish_author:nnn {#2}{#4}{#1}
  }
% Each full affiliation is braced in the list so its own commas stay intact.
\NewDocumentCommand{\KUAddAuthorMulti}{O{} m m m}
  {
    \seq_clear:N \l__ku_author_aff_seq
    \clist_map_inline:nn {#3} { \__ku_auto_aff_add:n {##1} }
    \__ku_finish_author:nnn {#2}{#4}{#1}
  }
\newcommand{\KUResetAuthors}{%
  \gdef\KU@authors{}%
  \int_gzero:N \g__ku_auto_aff_int
  \seq_gclear:N \g__ku_aff_ids_seq
  \prop_gclear:N \g__ku_aff_text_prop
  \seq_gclear:N \g__ku_email_seq
  \forcsvlist{\KU@resetrole}{equal,lead,corresponding,senior}}
\newcommand{\KUAffiliation}[2]{\__ku_aff_add:nn{#1}{#2}}
% \KUEmail{email} or legacy \KUEmail{name}{email}; the name is ignored.
\NewDocumentCommand{\KUEmail}{m g}{%
  \IfNoValueTF{#2}{\__ku_email_add:n{#1}}{\__ku_email_add:n{#2}}}
\newcommand{\KU@metacontent}{%
  \fontsize{9}{12}\selectfont\color{KUSecondary}\centering
  \__ku_meta_print:}
\ExplSyntaxOff
\newcommand{\KU@resetrole}[1]{\csundef{KU@used@#1}}
\newcommand{\KU@markrole}[1]{%
  \ifcsdef{KU@symbol@#1}{\csgdef{KU@used@#1}{1}}{%
    \ClassError{kuarxiv}{Unknown author role '#1'}{Use equal, lead, corresponding, or senior.}}}
\newcommand{\KUAuthor}[3]{%
  \forcsvlist{\KU@markrole}{#3}%
  \g@addto@macro\KU@authors{\KU@onename{#1}{#2}{#3}}}
\newcommand{\KU@printrole}[1]{\csuse{KU@symbol@#1}}
\newcommand{\KU@onename}[3]{%
  \KU@separator\def\KU@separator{\hspace{1em}\allowbreak}%
  \mbox{{\bfseries #1}\textsuperscript{\textcolor{KUCrimson}{#2%
    \ifstrempty{#2}{}{\ifstrempty{#3}{}{,}}%
    \forcsvlist{\KU@printrole}{#3}}}}}
\newcommand{\KUContribution}[2]{%
  \ifcsdef{KU@symbol@#1}{\csgdef{KU@note@#1}{#2}}{%
    \ClassError{kuarxiv}{Unknown contribution role '#1'}{Use a documented role key.}}}
\newcommand{\KU@onenote}[1]{%
  \ifcsdef{KU@used@#1}{\KU@noteseparator\def\KU@noteseparator{;\space}%
    \textsuperscript{\csuse{KU@symbol@#1}}\,\csuse{KU@note@#1}}{}}
\newcommand{\KU@authorcontent}{%
  \fontsize{9}{11.5}\selectfont\color{KUMetadata}\centering
  \setlength{\parskip}{2pt}\setlength{\parindent}{0pt}%
  \ifx\KU@authors\@empty \@author\par\else
    {\fontsize{10}{13}\selectfont\rmfamily\bfseries\def\KU@separator{}\KU@authors\par}%
    \addvspace{3pt}%
    {\KU@metacontent\par}%
    {\fontsize{8}{10}\selectfont\color{KUSecondary}\centering%
      \def\KU@noteseparator{}\forcsvlist{\KU@onenote}{equal,lead,corresponding,senior}\par}%
  \fi}
\newcommand{\abscontent}{%
  \par\addvspace{12pt}%
  {\color{KUCrimson}\bfseries\fontsize{11}{13}\selectfont\abstractname\par}%
  \nobreak\vspace{3pt}%
  {\fontsize{10}{13}\selectfont\theabstract\par}%
  \@ifundefined{@keywords}{}{\par\vspace{4pt}%
    {\fontsize{9}{11.5}\selectfont\color{KUSecondary}\textbf{Keywords: }\@keywords\par}}}
% Resources are optional, reusable paper metadata.
\def\KU@resources{}
\newcommand{\KUResetResources}{\gdef\KU@resources{}}
\newcommand{\KUResource}[2]{%
  \g@addto@macro\KU@resources{\KU@oneresource{#1}{#2}}}
\newcommand{\KU@oneresource}[2]{%
  \par\noindent\textbf{#1: }\href{#2}{\nolinkurl{#2}}}
\newcommand{\KU@resourcecontent}{%
  \fontsize{9}{12}\selectfont\raggedright\color{KUSecondary}%
  \setlength{\parindent}{0pt}\setlength{\parskip}{2pt}\KU@resources\par}
% Transparent vector logo: no colored image container or raster conversion.
\newcommand{\KU@logotile}{%
  \includegraphics[width=\linewidth,keepaspectratio]{TemplateAssets/ku_logo.pdf}}
\newsavebox{\KU@resourcebox}
\newcommand{\KU@resourcearea}{%
  \ifthenelse{\boolean{logo}}{%
    \par\addvspace{10pt}%
    \ifx\KU@resources\@empty
      \noindent\hfill\begin{minipage}[t]{.26\linewidth}\vspace{0pt}\KU@logotile\end{minipage}\par
    \else
      \sbox{\KU@resourcebox}{\begin{minipage}{.70\linewidth}\KU@resourcecontent\end{minipage}}%
      \ifdim\dimexpr\ht\KU@resourcebox+\dp\KU@resourcebox\relax>.25\textheight
        {\KU@resourcecontent}\par\noindent\hfill
        \begin{minipage}[t]{.26\linewidth}\vspace{0pt}\KU@logotile\end{minipage}\par
      \else
        \noindent\begin{minipage}[t]{.70\linewidth}\vspace{0pt}\KU@resourcecontent\end{minipage}%
        \hfill\begin{minipage}[t]{.26\linewidth}\vspace{0pt}\KU@logotile\end{minipage}\par
      \fi
    \fi
  }{\ifx\KU@resources\@empty\else
       \par\addvspace{10pt}{\KU@resourcecontent}\fi}}
% Warm-white card with a softly layered, low-contrast warm shadow.
\definecolor{KUFrontBackground}{HTML}{FCF8F9}
\definecolor{KUFrontSecondary}{HTML}{626262}
\newcommand{\KU@frontmatter}{%
  \begingroup
  \begin{tcolorbox}[enhanced,breakable,colback=KUFrontBackground,opacityback=1,
    colframe=KUFrontBackground,opacityframe=0,coltext=black,boxrule=0pt,arc=2.5mm,
    left=5mm,right=5mm,top=4.5mm,bottom=4.5mm,boxsep=0pt,
    fuzzy shadow={0.35mm}{-0.65mm}{-0.1mm}{0.12mm}{fill=KUShadow!24!white},
    before skip=0pt,after skip=10pt]
  % Preserve university Crimson for title and role markers.
  \colorlet{KUMetadata}{black!75}\colorlet{KUSecondary}{KUFrontSecondary}%
  \hypersetup{linkcolor=KULink,citecolor=KUCitation,urlcolor=KULink}%
  \setlength{\parindent}{0pt}\setlength{\parskip}{0pt}%
  {\titlefont\@title\par}%
  \par\addvspace{10pt}{\KU@authorcontent}\par
  \abscontent\KU@resourcearea
  \end{tcolorbox}
  \endgroup}
\renewcommand{\maketitle}{%
  \par\if@twocolumn
    \twocolumn[\KU@frontmatter\vspace{4pt}]%
    \thispagestyle{firststyle}%
  \else
    \thispagestyle{firststyle}\KU@frontmatter
  \fi}
\makeatother

\titleformat{\section}
{\headingfont}
{\thesection}
{1em}
%{\MakeUppercase{#1}}[]
{\makefirstuc{#1}}
[]

\titleformat{name=\section,numberless}
{\headingfont}
{}
{0em}
%{\MakeUppercase{#1}}[]
{#1}
[]
% Subsections retain the body serif family, with bold upright text.
\titleformat{\subsection}
{\normalfont\normalsize\bfseries\color{Black}}
{\thesubsection}
{1em}
{\makefirstuc{#1}}
[]
\titleformat{\subsubsection}% [runin] If want to have inline for the subsubsect
{\bfseries\itshape}
{\thesubsubsection.}
{0.5em}
{\makefirstuc{#1}}
[]


\titlespacing*{\section}{0pc}{3ex plus4pt minus3pt}{5pt}
%\titlespacing*{\section}{0pc}{1ex }{\baselineskip}
\titlespacing*{\subsection}{0pc}{3.5ex plus3pt minus2pt}{2pt}
\titlespacing*{\subsubsection}{0pc}{2ex plus2.5pt minus1.5pt}{2pt}
%\titlespacing*{\paragraph}{0pc}{2ex plus2pt minus1pt}{0pt}

%%======== Captions in tables and figures ========
\DeclareCaptionLabelSeparator{pipe}{:~}% or $\vert$
\captionsetup{font=small,labelfont=bf,%
figurename=\textbf{Figure},%
labelsep=pipe,
singlelinecheck=off,%
%justification=centering
}

