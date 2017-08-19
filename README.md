bibLaTeX-__archaeologie__    
======= 



bibLaTeX-style for archaeologists, historians and philologists.
---
_2017/08/10 v2.3.3_


Copyright (c) 2017 Lukas C. Bossert | Johannes Friedl

* Email: [info@biblatex-archaeologie.de](mailto:info@biblatex-archaeologie.de)
* Website: [www.biblatex-archaeologie.de](http://www.biblatex-archaeologie.de)

This citation-style covers the citation and bibliography rules of 
the [__German Archaeological Institute__ (DAI)](http://www.dainst.org/dai/meldungen). 
Various options are available to change and adjust 
the outcome according to one’s own preferences.
(German, English, Italian, French, Spanish)

---
*Der Stil setzt die Zitations- und Bibliographievorgaben 
des [__Deutschen Archäologischen Instituts (DAI)__ ](http://www.dainst.org/dai/meldungen) (Stand 2014) um. 
Verschiedene zusätzliche Optionen erlauben das Erscheinungsbild 
jedoch auch zu verändern, um eigenen Vorlieben anzupassen.*

---

This style contains:

documentation:

- archaeologie.pdf
- archaeologie.tex
- archaeologie-ger.pdf (*short documentation*)
- archaeologie-ger.tex

mandatory:

* archaeologie.cbx
* archaeologie.bbx
* archaeologie.dbx

language files:

- archaeologie-german.lbx
- archaeologie-english.lbx
- archaeologie-french.lbx
- archaeologie-italian.lbx
- archaeologie-spanish.lbx

additional lists and bibliographies:

- archaeologie-examples.bib
- archaeologie-lstabbrv.bib
- archaeologie-lstpublishers.bib
- archaeologie-lstlocations.bib
- archaeologie-bibcorpora.bib
- archaeologie-bibancient.bib


# Changelog

All notable changes to this project will be documented in this file.
This project **does not** adhere to [Semantic Versioning](http://semver.org/).
The markdown syntax is inspired by the conventions proposed by [keepachangelog.com](http://keepachangelog.com/).

## unreleased (beta status)
#### *fixed*
* Arrangement of multiple authors with `\textcites`; see
[#115](https://github.com/LukasCBossert/biblatex-archaeologie/issues/115), solved with [https://tex.stackexchange.com/a/387162/98739](https://tex.stackexchange.com/a/387162/98739)

## v2.3.3 (2017-08-10) --> [current release]

#### *fixed*
* typo in documentation

#### *added* 
* if there is no `translator` `\citetranslator` will fall back to the `bibstring` "owntranslation" which can be modified; see [#112](https://github.com/LukasCBossert/biblatex-archaeologie/issues/112) and [tex.stackexchange.com/q/385719/98739](https://tex.stackexchange.com/q/385719/98739) thanks to [moewe](https://tex.stackexchange.com/users/35864/moewe)

## v2.3.2 (2017-07-19)

#### *fixed*
* wrong code-example in documentation
* issue [#111](https://github.com/LukasCBossert/biblatex-archaeologie/issues/111) (regarding option `inreferences`) solved, thanks to [moewe](https://tex.stackexchange.com/users/35864/moewe)

## v2.31 (2017-05-29) 

#### *fixed*
* number after year in an article if there is no volume.
* volume and title for ancient publications

## v2.3 (2017-02-27)
#### *fixed*
* empty space deleted after bibliography entries (has only been visible when using option `seenote`)
* typo in the German documentation
* related example in German documentation corrected

#### *added* 
* get the translator of an ancient opus with `\citetranslator` or `\citetranslator*`
* more citation commands (`\smartcite`; `\autocite`; `\fullcite`; `\footfullcite`)
* support for `polyglossia`

## v2.2b (2016-10-06) 
* *typo* <br> documentation with new style

## v2.2 (2016-09-25)
* *added* <br> `uniqueme` for variant translations of ancient works.
* *added* <br> bibliography-file `archaeologie-examples.bib` included


[current release]: http://www.biblatex-archaeologie.de
[unreleased]: http://github.com/LukasCBossert/biblatex-archaeologie


______________________

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in [http://www.latex-project.org/lppl.txt](http://www.latex-project.org/lppl.txt) and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

---
This work has the LPPL maintenance status _maintained_.
The current maintainer of this work is [Lukas C. Bossert](https://github.com/LukasCBossert).

