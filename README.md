# biblatex-archaeologie


##################
##      To do   ##
##################
	
--> Abkürzungsverzeichnis für shortjournal-Zeitschriftentitel?!?  x-)
	-->LCB: gute Idee
vgl. http://www.latex-community.org/forum/viewtopic.php?f=5&t=690

-- ein "et. al." / u.a. fehlt, oder wird nicht mehr angezeigt?!?!

- Feld "Volume" bei (beispw.) Book wird nicht ausgelesen!??!

--> URL auslesen nur bei "online" oder PhD

##########################
##      DAI-Implementierung   ##
##########################
Option:
	dai = true
	
Erledigt:
	- Edition vor die Klammer
	- Initialien der Vornamen von Autor und Herausgeber
	- Keine Verlagsangabe


####################
## Verbesserungen ##
####################
(2015-06-15) --> Corpora-Einträge: \cite[06, 01234]{CIL} --> CIL 06, 01234 (mit Verknüpfung zum Eintrag CIL in Bibliographie (Neuerung ist, dass zwischen CIL und 06 KEIN Komma ausgelesen wird (wegen options = nurshorthand), wie sonst bei Autoren-Einträge); wichtig sind "Keywords, options und Shorthand"

@Book{CIL,
  Title                    = {Corpus Inscriptionum Latinarum},
  Address                  = {Berlin},
  Year                     = {1863--},

  Keywords                 = {Sigel},
  Options                  = {nurshorthand},
  Shorthand                = {CIL},
}
\printbibliography[keyword=Sigel,heading=subbibintoc,title={Abkürzungen und Sigeln}] 





(2015-06-15) --> Lexika-Einträge optional mit verschiedenen Zitationsformen in Fußnoten wählbar: (1.) Autor-Jahr: (Nieddu (1995)); (2.) Autor-Titel; Nieddu, Dei Consentes (1995) (3.) DAI-Zitation: LTUR 2 (1995) 9-10 s. v. Dei Consentes (G. Nieddu)
		Voraussetzung: beim Datensatz-Eintrag "options = {lexikon}"; optional bietet sich an "keywords = {lexikon}", um diese Einträge dann in der Bibliographie auszuschließen
			preamble-funktion: "lexika=true"; (=false --> Autor-Jahr, oder Autor-Titel)

@Inreference{Nieddu_1995,
  Title                    = {Dei Consentes},
  Author                   = {Nieddu, Giuseppe},
  Year                     = {1995},
  Maintitle                = {LTUR},
  Pages                    = {9--10},
  Volume                   = {2},

  Bookpagination           = {column},
  Keywords                 = {lexikon},
  Options                  = {lexikon},
}

\printbibliography[%
		notkeyword=Quelle,%
		notkeyword=Sigel,%
		notkeyword=unbekannt,%
		notkeyword=lexikon,% kommentieren wenn lexikon=false
		heading=subbibintoc,title={Forschungsliteratur}] 




(2015-06-15) --> Einträge mit unbekannten Autoren/Editoren:, --> Datensatz-Eintrag "options = {unbekannt}", "shorthand = {key}". ==> In Anmerkungen wird Shorthand und Jahr in [] gesetzt und so auch dann wieder in Bibliographie ausgegeben: 
[Cosa (1949)] = Cosa. Republican Colony in Etruria, The Classical Journal 45/1, 1949, 141– 149.		

@Article{Cosa_1949,
  Title                    = {Cosa},
  Author                   = unbekannt,
  Journal                  = {The Classical Journal},
  Pages                    = {141--149},
  Volume                   = {45},
  Year                     = {1949},
  Number                   = {1},



  Keywords                 = {unbekannt},
  Options                  = {unbekannt},
  Shorthand                = {Cosa},
  Subtitle                 = {Republican Colony in Etruria},
}





--> Verknüpfungen von antiken Autoren mit Bibliographie über hyperref funktioniert nicht?! liegt an "printshorthand"?
	(2015-06-15) --> behoben! Hyperref zu \printshorthand geht nicht, mit aktueller Version umgestellt und Antike Autoren werden mit \printbibliography ausgegeben, dann funktioniert hyperref
===> \printbibliography[keyword=Quelle,heading=subbibintoc,title={Antike Quellen}] 

Mart. Epigr. = Marcus Valerius Martialis, Epigramme aus dem Lateinischen übers. von Paul Barié und Winfried Schindler Sammlung Tusculum (Düsseldorf – Zürich: Artemis & Winkler 32013).

@Book{Mart_Epigr,
  Title                    = {Epigramme},
  Address                  = {Düsseldorf and Zürich},
  Author                   = {Valerius Martialis, Marcus},
  Editor                   = {Paul Barié and Winfried Schindler},
  Publisher                = {Artemis \& Winkler},
  Series                   = {Sammlung Tusculum},
  Year                     = {2013},

  Edition                  = {3},

  Keywords                 = {Quelle},
  Options                  = {antik},
  Origlanguage             = {latin},

  Shorthand                = {Mart. Epigr.},
  Translator               = {Paul Barié and Winfried Schindler},
  Usera                    = {Martial}
}






(2015-06-04) --> \citeauthor{BibtexKey} und \citetitle{BibtexKey} werden mit Verknüpfungen zur Bibliographie ausgelesen, mit Unterscheidung ob antikes Werk/antiker Autor, dann Auslesen anderer Felder. Wenn antiker Autor, dann wird das feld "usera" ausgelesen: Usera = {Cicero}
Befindet sich ein \citeauthor{BibtexKey} innerhalb einer Fußnote, wird automatisch(!) nur der Nachname ausgegeben.


(2015-06-04) ---> Umbenennung des stils in "archaeologie" 

(2015-06-04) --> Doktorarbeiten (Master-/Magisterarbeiten) werden jetzt "richtig" ausgegeben. Verwendung von @thesis (!); wichtiges Feld: type = {phdthesis} oder type = {mathesis}, auszufüllen ist Feld "school" oder "institution" (egal, da school als alias von institution verwendet wird)

(2015-06-04) --> URL/DOI/eprint werden (bspw. bei @thesis) in eine neue Zeile geschrieben

(2015-06-04) --> Bei Übersetzungen, Angabe von Übersetzer, originaler Titel und originale Sprache (Felder: translator, origlanguage, origtitle) 
	(2015-06-15) ist nun optional mit "notranslator = true/false" in preamble ansteuerbar

(2015-04-15) --> Proceedings und Inproceedings sind jetzt aufgenommen - werden wie (in)collection angezeigt, aber bei ausgefülltem "venue" und "eventdate" und "event"-Feldern werden diese mit ausgegeben.

--> Autor-Jahr funktioniert jetzt. autorjahr=true verändert nun die Bibliographie-Umgebung in Autor-Jahr-Stil (auch der bibnamedash ist in dieser Umgebung rausgenommen). autorjahr=false bildet obligatorisch "Autor, Kurztitel", die Bibliographie-Umgebung ist wie vorher (inkl. bibnamedash). Option kurztitel ist damit obsolet und wurde gelöscht. 

	Für die Autor-Jahr-Zitation wurde der Autoreneintrag in der Bibliographie in Vorname-Nachname verändert. Die Optionen citeinit und mitvn haben Auswirkungen auf den Autor-Jahr-Stil. Die Option nurinit hat nun nur noch Auswirkungen auf die Bibliographie und nicht mehr global zusätzlich auf citeinit. Damit kann man unabhängig Einstellungen machen.

	Die Optionen mitjahr und jahrkeineklammern gibt es weiterhin, mit folgenden Auswirkungen: mitjahr tritt nur bei autorjahr=false in Kraft (sonst passiert nichts). Man erhält so einen Autor-Kurztitel-Stil ohne Jahr. Die Option jahrkeineklammern verändert die Jahres-Ausgabe in beiden Fällen (autorjahr=true/false).



Verändert:
\newbibmacro*{cite:title}{%                           %%>> JF: neu, option kurztitel=true/false
   \ifbool{cbx:kurztitel}%                            %%>>
     {\iffieldundef{shorttitle}{%                     %%>>
	\printfield{title}%     			%%--> LCB: damit wird nur der title ohne subtitle ausgelesen
     %  \usebibmacro{title}%                           %%>>
      }{\printfield{shorttitle}}}%                    %%>>
   {}%                                                %%>>
}%



###################
## neue Optionen ##
###################
lexika=true, %% 		true=Lexikon-Einträge werden nach DAI in Fußnote gesetzt (=false --> Autor-Jahr, oder Autor-Titel)
 autorjahr=true,		%% true = Zitation im Autor-Jahr-System; Anpassung der Bibliographie; false = Zitation im Autor-Titel-System
shortjournal=false,	%% true = nur Kurzname der Zeitschrift (Feld: "shortjournal"), wenn "shortjournal" leer, dann Feld "journal"; false = Angabe von Feld "journal"
notranslator=true,	%% true = keine Angabe von Originaltitle, Originalsprache, Übersetzer; false = "Originaltitel: XY, übers. v. Z"
hrsg=true,		%% false = "hrsg. v. XY"; true = "XY (Hrsg.)“
citeinit=false, 	%% false = keine Initiale in Fußnoten, true =  in Fußnoten Initiale nachgestellt
mitvn=false,		%% false = keine Vornamen in Fußnote; true = Vornamen in Fußnote nach Nachname
jahrkeineklammern=true,	%% false = (2015); true = 2015
mitjahr=true,%		%% WENN "kurztitel = true", DANN:  false = keine Jahresangabe in der Fußnote; true = Jahresangabe nach Kurztitel in Klammer
jahrreihe=false,%	%% false = Serie und Nummer VOR Erscheinungsort und -jahr; true = Serie und Nummer NACH Erscheinungsort und -jahr
dai = true 		%% Zitation nach DAI


##############
## Optional ##
##############

--> Die Rezensionen sind nicht gut gelöst. Alles ist in das Titelfeld gepackt, obwohl man es mit crossref verlinken könnte.

	==> LCB: jetzt kann man Autor, Titel. Subtitle, Erscheinungsjahr vom rezensierten Werk automatisch über crossref anzeigen und verknüpfen lassen ->  ist kein crossref-Eintrag vorhanden, wird der Titel von @review ausgelesen.
Die Verknüpfung zum rezensierten Werk funktioniert nur, WENN das rezensierte Werk  ebenfalls in der Bibliographie ist- sonst wird nur der Titel der Rezension angzeigt. (Daran könnte und sollte man noch arbeiten)

	==> Problem ist die Darstellung in den Fußnoten. Da wird trotz eigener Rezensionstitel der subtitle des rezensierten Werks angegeben...

####################
## Antike Autoren ##
####################

- Können mit \printshorthands ausgegeben werden. Autorennamen lassen sich gut in das Feld für die modernen Autorennamen eingliedern, z.B. Ovidius Naso, Publius.
	==> LCB: oder man trägt ein author = {\mbox{P. Ovidius Naso}} --> Vorteil: bei einem \citeauthor wird nicht "Ovidius Naso" sondern "P. Ovidius Naso" im Fließtext ausgegeben



############
## Gelöst ##
############


--> Abkürzungen von Zeitschriften: 
	über die Option "shortjournal=true" kann man nun nur die im Feld "shortjournal" eingetragenen Kurzbezeichnungen auslesen lassen. Wenn das Feld "shortjournal" nicht belegt ist, wird automatisch das Feld "journal" ausgelesen.

--> Nach \cite-Befehl erfolgt nun keine Fussnote automatisch (\DeclareCiteCommand{\cite}). Gefahr besteht noch bei Erstzitaten (sofern wir das behalten). Diese würden nun auch im Fließtext voll ausgeschrieben werden.

--> Reihenfolge von Vor- und Nachname bei Hrsg-Angabe tauschen.
	bislang: , in: Bossert, Lukas (Hrsg.) --> gewünscht: , in: L. Bossert (Hrsg.)

--> publisher ist Teil des Vollzitats
	JF: Nochmals Änderung in \newbibmacro*{location+edition+year} vorgenommen. Da hatte sich noch ein Fehler eingeschlichen (bei fehlendem Verlagsort).

--> Es gibt jetzt auch eine reine Autor-Jahr-Option ohne shorttitle. Ist vielleicht mal ganz praktisch das noch zusätzlich zu haben. Man muss nur unter den biblatex-Optionen kurztitel=true setzen.

--> Volume wurde bei Zeitschriften nicht ausgelesen, geschichtsfrkl liest nur Number aus. Habe Volume ergänzt. Zudem noch die Klammern bei der Jahreszahl entfernt (DAI). Stimmt dann auch bei Review.

--> Ort, Verlag, Jahr sowie Erstauflage in Klammern, Reihentitel und -nummern nun mit Kommata an den Buchtitel gehängt.