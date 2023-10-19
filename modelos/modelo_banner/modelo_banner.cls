%Classe base do resumo simples
\ProvidesClass{modelo_banner}
\LoadClass{article}

\setlength{\paperwidth}{841mm}
\setlength{\paperheight}{1189mm}

\RequirePackage[utf8]{inputenc}
\RequirePackage[portuguese]{babel}
\RequirePackage[T1]{fontenc}

%Símbolos matemáticos
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}

%Inclusão de figuras
\RequirePackage{graphicx}
\RequirePackage{float}

\RequirePackage{ifthen}

%\RequirePackage{indentfirst}
\RequirePackage{multicol}

\RequirePackage{titlesec}		%Pacote para mudança da especificação de seções
\RequirePackage{helvet} 			%Para usar a fonte arial

\RequirePackage{setspace} 		%Pacote para espaçamento de linhas

%Espeficiação das margens
\RequirePackage[left=3cm,right=3cm,top=0cm,bottom=0cm]{geometry}

%Caixa alta para os textos das seções
\RequirePackage{sectsty}
\RequirePackage{titlecaps}

%Referência ABNT
\RequirePackage[alf, abnt-emphasize=bf]{abntex2cite}

%Especificação de fonte: Arial
\renewcommand{\familydefault}{\sfdefault}

%Retira a indentação dos parágrafos
\setlength\parindent{0pt}

%Espaçamento entre linhas de 1,5
%\singlespacing
\linespread{3} 

%Determina o espaçamento entre parágrafos
\setlength{\parskip}{5pt}

%Determina o espaço vertical entre as referências bibliográficas
\let\OLDthebibliography\thebibliography
\renewcommand\thebibliography[1]{
  \OLDthebibliography{#1}
  \setlength{\parskip}{20pt}
  %\setlength{\itemsep}{0pt plus 0.3ex}
}

%Especifica os tamanhos das fontes
\renewcommand\LARGE{\@setfontsize\LARGE{62pt}{18}}
\renewcommand\large{\@setfontsize\large{39pt}{18}}
\renewcommand\normalsize{\@setfontsize\normalsize{40pt}{18}}
\renewcommand\Large{\@setfontsize\Large{53pt}{18}}
\renewcommand\footnotesize{\@setfontsize\footnotesize{27pt}{18}}

%Tamanho da fonte da seção
\titleformat*{\section}{\Large\bfseries}

%Retira o contador numérico das seções
\setcounter{secnumdepth}{0}

%Escreve o texto das seções em caixa alta
\sectionfont{\MakeUppercase}

%Distância entre as duas colunas
\setlength\columnsep{4.5cm}

%Variáveis
\def\titulo#1{\def\@titulo{#1}}
\titulo{}

\def\primeiroAutor#1{\def\@primeiroAutor{#1}}
\primeiroAutor{}

\def\segundoAutor#1{\def\@segundoAutor{#1}}
\segundoAutor{}

\def\terceiroAutor#1{\def\@terceiroAutor{#1}}
\terceiroAutor{}

\def\quartoAutor#1{\def\@quartoAutor{#1}}
\quartoAutor{}

\def\quintoAutor#1{\def\@quintoAutor{#1}}
\quintoAutor{}

\def\sextoAutor#1{\def\@sextoAutor{#1}}
\sextoAutor{}

\def\abreviacaoPrimeiroAutor#1{\def\@abreviacaoPrimeiroAutor{#1}}
\abreviacaoPrimeiroAutor{}

\def\abreviacaoSegundoAutor#1{\def\@abreviacaoSegundoAutor{#1}}
\abreviacaoSegundoAutor{}

\def\abreviacaoTerceiroAutor#1{\def\@abreviacaoTerceiroAutor{#1}}
\abreviacaoTerceiroAutor{}

\def\abreviacaoQuartoAutor#1{\def\@abreviacaoQuartoAutor{#1}}
\abreviacaoQuartoAutor{}

\def\abreviacaoQuintoAutor#1{\def\@abreviacaoQuintoAutor{#1}}
\abreviacaoQuintoAutor{}

\def\abreviacaoSextoAutor#1{\def\@abreviacaoSextoAutor{#1}}
\abreviacaoSextoAutor{}

\def\notaPrimeiroAutor#1{\def\@notaPrimeiroAutor{#1}}
\notaPrimeiroAutor{}

\def\notaSegundoAutor#1{\def\@notaSegundoAutor{#1}}
\notaSegundoAutor{}

\def\notaTerceiroAutor#1{\def\@notaTerceiroAutor{#1}}
\notaTerceiroAutor{}

\def\notaQuartoAutor#1{\def\@notaQuartoAutor{#1}}
\notaQuartoAutor{}

\def\notaQuintoAutor#1{\def\@notaQuintoAutor{#1}}
\notaQuintoAutor{}

\def\notaSextoAutor#1{\def\@notaSextoAutor{#1}}
\notaSextoAutor{}

\def\notaReferenciaPrimeiroAutor#1{\def\@notaReferenciaPrimeiroAutor{#1}}
\notaReferenciaPrimeiroAutor{}

\def\notaReferenciaSegundoAutor#1{\def\@notaReferenciaSegundoAutor{#1}}
\notaReferenciaSegundoAutor{}

\def\notaReferenciaTerceiroAutor#1{\def\@notaReferenciaTerceiroAutor{#1}}
\notaReferenciaTerceiroAutor{}

\def\notaReferenciaQuartoAutor#1{\def\@notaReferenciaQuartoAutor{#1}}
\notaReferenciaQuartoAutor{}

\def\notaReferenciaQuintoAutor#1{\def\@notaReferenciaQuintoAutor{#1}}
\notaReferenciaQuintoAutor{}

\def\notaReferenciaSextoAutor#1{\def\@notaReferenciaSextoAutor{#1}}
\notaReferenciaSextoAutor{}

\newcommand{\banner}{
	\hspace*{-3.25cm}{
		\includegraphics[width=84cm]{banner.png}
	}
}

\usepackage{dblfloatfix}
\newcommand{\rodape}{
	\begin{figure*}[!b]
		\hspace*{-3.25cm}
		\includegraphics[width=84cm]{rodape.png}
	\end{figure*}	
}

\newcommand{\construirtitulo}{
	\banner

	\vspace{4cm}

	\begin{center}
		\bfseries
		\LARGE
		\@titulo
	\end{center}
	
	\vspace{2.5cm}
}

\newcommand{\autor}[4]{\ifthenelse{\equal{}{#2}}{}{\ifthenelse{\equal{1}{#1}}{#2}{; #2}}\ifthenelse{\equal{}{#3}}{}{\textsuperscript{\ref{nota:#1}}}\ifthenelse{\equal{}{#4}}{}{\textsuperscript{\ref{nota:#4}}}}

\newcommand{\nota}[2]{
	\ifthenelse{\equal{}{#2}}{}{\item \label{nota:#1} #2}
}

%Comandos
\newcommand{\construirautores}{
	\begin{center}
		\singlespacing
		\large
\autor{1}{\@abreviacaoPrimeiroAutor}{\@notaPrimeiroAutor}{\@notaReferenciaPrimeiroAutor}\autor{2}{\@abreviacaoSegundoAutor}{\@notaSegundoAutor}{\@notaReferenciaSegundoAutor}\autor{3}{\@abreviacaoTerceiroAutor}{\@notaTerceiroAutor}{\@notaReferenciaTerceiroAutor}\autor{4}{\@abreviacaoQuartoAutor}{\@notaQuartoAutor}{\@notaReferenciaQuartoAutor}\autor{5}{\@abreviacaoQuintoAutor}{\@notaQuintoAutor}{\@notaReferenciaQuintoAutor}\autor{6}{\@abreviacaoSextoAutor}{\@notaSextoAutor}{\@notaReferenciaSextoAutor}
		\footnotesize
		\begin{enumerate}		
			\centering
			\nota{1}{\@notaPrimeiroAutor}
			\nota{2}{\@notaSegundoAutor}
			\nota{3}{\@notaTerceiroAutor}
			\nota{4}{\@notaQuartoAutor}
			\nota{5}{\@notaQuintoAutor}
			\nota{6}{\@notaSextoAutor}
		\end{enumerate}		
	\end{center}
	
	\vspace{2cm}
}

%Muda o título da seção de referências
\addto\captionsportuguese{\renewcommand{\refname}{Referências Bibliográficas}}

%Inclui as referências
\newcommand{\referencias}{
	%\bibliographystyle{abnt-alf}
	\bibliography{referencias}
}
		

%Ambientes
\newenvironment{resumo}{
	\noindent 
	{\bf Resumo}
	\newline
	\normalfont
}{

}

\newenvironment{palavras_chave}{
	\noindent 
	\textbf{Palavras-chave:}
	\normalfont
}{}