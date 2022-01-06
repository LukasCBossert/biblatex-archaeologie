# bibLaTeX-**archaeologie** Bundle

## bibLaTeX-style for archaeologists, historians and philologists.

Copyright (c) 2015-2020 Lukas C. Bossert

Copyright (c) 2015 Lukas C. Bossert | Johannes Friedl

- Email: [info@biblatex.texografie.de](mailto:info@biblatex.texografie.de)
- Website: [www.biblatex-archaeologie.texografie.de](http://biblatex-archaeologie.texografie.de)

This citation-style covers the citation and bibliography rules of
the [**German Archaeological Institute** (DAI)](http://www.dainst.org/dai/meldungen).
Various options are available to change and adjust
the outcome according to one’s own preferences.
(German, English, Italian, French, Spanish)

---

_Der Stil setzt die Zitations- und Bibliographievorgaben
des [**Deutschen Archäologischen Instituts (DAI)** ](http://www.dainst.org/dai/meldungen) (Stand 2014) um.
Verschiedene zusätzliche Optionen erlauben das Erscheinungsbild
jedoch auch zu verändern, um eigenen Vorlieben anzupassen._

---

This style contains:

documentation:

- archaeologie.pdf
- archaeologie.dtx

mandatory:

- archaeologie.cbx
- archaeologie.bbx
- archaeologie.dbx

language files:

- german-archaeologie.lbx
- english-archaeologie.lbx
- french-archaeologie.lbx
- italian-archaeologie.lbx
- spanish-archaeologie.lbx

additional lists and bibliographies:

- archaeologie-examples.bib
- archaeologie-lstabbrv.bib
- archaeologie-lstpublishers.bib
- archaeologie-lstlocations.bib
- archaeologie-bibcorpora.bib
- archaeologie-bibancient.bib

---

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in [http://www.latex-project.org/lppl.txt](http://www.latex-project.org/lppl.txt) and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

---

This work has the LPPL maintenance status _maintained_.
The current maintainer of this work is [Lukas C. Bossert](https://github.com/LukasCBossert).

## Installation of the bundle

`archaeologie` is part of the distributions [MiKTeX](http://www.miktex.org)
and [TeXLive](http://www.tug.org/texlive) -- thus, you
can easily install it using the respective package manager.
If you would like to
install `archaeologie` into your local folder manually, do the following:
Go to your terminal, browse to the folder of this bundle and run

`make install`

If you are using macOS you will be asked for your user account password for the installation.

Further options of this makefile are:

- `clean`: deletes all unnecessary files
- `cleanbundle`: deletes all files except `.dtx`, `.md`. You will get the plain version of this bundle.
  This might be helpful if you send the bundle to someone else.
- `ctan`: this will create a zip file which can be used to send to CTAN.
- `files`: will only create the files from the `.dtx`-scratch.
- `uninstall`: will erase the locally installed files.

This bundle is constantly updated. For hints, errors or suggestions use the GitHub repository [https://github.com/LukasCBossert/biblatex-archaeologie](https://github.com/LukasCBossert/biblatex-archaeologie).

## Changelog

All notable changes to this project will be documented in the [README.md](https://github.com/LukasCBossert/biblatex-archaeologie/blob/master/README.md).
This project **does not** adhere to [Semantic Versioning](http://semver.org/).
The markdown syntax is inspired by the conventions proposed by [keepachangelog.com](http://keepachangelog.com/).

## v2.4.5 (2020-08-08)

### _Added_

- Informational remark about greek letters in `@strings` in the additional `bib`-files (see Issue 153)[https://github.com/LukasCBossert/biblatex-archaeologie/issues/153]

### _Fixed_

- stale link in description corrected (http://biblatex-archaeologie.texografie.de/)

## v2.4.4 (2020-02-15)

### _Fixed_

- corrected the use of the `maintitlepunct` in the bibmacro `maintitle+title+volumes`

## v2.4.3 (2019-12-03)

### _Fixed_

- Spelling error in Italian language for Dresden and München. Thanks to Matteo Turri. (Feedback always welcome!)
- Some code refactoring for better literate programming.

## v2.4.2 (2019-05-01)

### _Fixed_

- Handling ranges of years for `inreferences` [see issue no. 150](https://github.com/LukasCBossert/biblatex-archaeologie/issues/150)

### _Changed_

- Renaming `\labelnamepunct` to `\nametitledelim` (biblatex 3.12 compatibility)

## v2.4.1 (2019-04-11)

### _Fixed_

- some errors in the documentation

### _Changed_

- default sorting template changed to `ndymdt`, as suggested in https://tex.stackexchange.com/a/46879/98739 [see issue no. 148](https://github.com/LukasCBossert/biblatex-archaeologie/issues/148)

## v2.4.0 (2018-09-25)

### _Fixed_

- there was a bug if the field `eventdatelanguage` wasn’t defined [see issue no. 145](https://github.com/LukasCBossert/biblatex-archaeologie/issues/145)
- if the field `volume` doesn’t have an integer it won’t proceed with it as Roman numeral
- somehow the field `edition` was missing for `references`, fixed it.
- a mysterious space in the name part, got rid of it
- missing space before `volumes`, added a space

### _Changed_

- BIG change: all files are generated from the `.dtx` file. This is such a major change so we skipped some version numnbers and jumped directly to `2.4.0`.
- the fields `postnote` and `multipostnote` are formatted with `\mknormrange`, that means you don’t have to type `--` to get an endash for page ranges.

## v2.3.7 (2018-04-08)

### _Added_

- New data-field `arachne = {}` to reference to the database iDAI.objects arachne
- Alias `matheseis` for `thesis` (for all Zotero-users) (`\DeclareBibliographyAlias{mathesis}{thesis}`)
- field `eventdatelanguage`, you can get the date of the field `eventdate` in the chosen language, enable with `eventdatelanguage=true`

### _Changed_

- `inreferences=true` is now called `inreferencesasfullcite=true` due to better understanding of the option. There is a fallback.
- `bibstrings` are defined in `archaeologie.bbx` now
- `editortype` is now used as `parens`
- `autolang=hyphen` now you can use `langid={}` to manage to language of an entry

### _Fixed_

- better coding for the year delimiter (thanks to moewe!)

### _Deleted_

- Version `initials` has to be deleted since its incompatibility to `biber`-version `2.11` see [https://github.com/plk/biber/issues/215](https://github.com/plk/biber/issues/215)

## v2.3.6 (2018-02-20)

### _Added_

- `citeauthorformat=firstinitialsthenfamily` as requested in
  [see issue no. 138](https://github.com/LukasCBossert/biblatex-archaeologie/issues/138),
- `citeauthorformat=firstfullthenfamily`

### _Changed_

- `jstor=false` by default, since it is no part of the guidelines
- `lstabbrv=true` by default
- `lstlocations=true` by default
- `lstpublishers=true` by default
- `citeauthorformat=firstfull` is now called `citeauthorformat=firstfulltheninitials`

### _Fixed_

- wrong entry with `\archaeologieoptions` deleted
- labeldates now work correctly

## v2.3.5 (2018-02-13)

### _Fixed_

- `\citereset` for author names [see issue no. 122](https://github.com/LukasCBossert/biblatex-archaeologie/issues/122)
- `\citetitle` will give the original title of a work which has the option `ancient`;
  `\citetitle*` instead will always give title without year.
- no comma before `in:` if title is missing (got wrong in last version)
- `volume`/`volumes` are now shown for `book` etc.
- `daterange` for a sequence of two years (now delimited by `\`)
- Short-journal for `Archaeologia`

### _Changed_

- `volume` is now automatically a Roman numeral for `book`, `inbook`, `collection`, `incollection`, `proceedings`, `inproceedings`, you only insert the Arabic number.

## v2.3.4 (2017-11-19)

This update is also due to compatibility with `biblatex 3.8a`/`biber 2.8`.

### _Fixed_

- Arrangement of multiple authors with `\textcites`; see
  [see issue no. 115](https://github.com/LukasCBossert/biblatex-archaeologie/issues/115), solved with [https://tex.stackexchange.com/a/387162/98739](https://tex.stackexchange.com/a/387162/98739)
- Delimiter of `subtitle` and `titleaddon`, it is now a comma instead of fullstop.
- Remodelled the bibmacro `volume` and fixed a bug of a duplicate `volume`.
- `in:` is now always with minor `I` it doesn’t matter if follows a dot.

#### _added_

- `@MvBook` and its children can be listed in the bibliography together [see issue no. 118](https://github.com/LukasCBossert/biblatex-archaeologie/issues/118)

- `\citetitle*` for showing the publication title without year of publication.

- You can use the namefield `bookauthor` now, then no _(ed.)_ will be printed.

## v2.3.3 (2017-08-10)

#### _fixed_

- typo in documentation

#### _added_

- if there is no `translator` `\citetranslator` will fall back to the `bibstring` "owntranslation" which can be modified; see [112](https://github.com/LukasCBossert/biblatex-archaeologie/issues/112) and [tex.stackexchange.com/q/385719/98739](https://tex.stackexchange.com/q/385719/98739) thanks to [moewe](https://tex.stackexchange.com/users/35864/moewe)

## v2.3.2 (2017-07-19)

#### _fixed_

- wrong code-example in documentation
- issue [see issue no. 111](https://github.com/LukasCBossert/biblatex-archaeologie/issues/111) (regarding option `inreferences`) solved, thanks to [moewe](https://tex.stackexchange.com/users/35864/moewe)

## v2.31 (2017-05-29)

#### _fixed_

- number after year in an article if there is no volume.
- volume and title for ancient publications

## v2.3 (2017-02-27)

#### _fixed_

- empty space deleted after bibliography entries (has only been visible when using option `seenote`)
- typo in the German documentation
- related example in German documentation corrected

#### _added_

- get the translator of an ancient opus with `\citetranslator` or `\citetranslator*`
- more citation commands (`\smartcite`; `\autocite`; `\fullcite`; `\footfullcite`)
- support for `polyglossia`

## v2.2b (2016-10-06)

- _typo_ <br> documentation with new style

## v2.2 (2016-09-25)

- _added_ <br> `uniqueme` for variant translations of ancient works.
- _added_ <br> bibliography-file `archaeologie-examples.bib` included
