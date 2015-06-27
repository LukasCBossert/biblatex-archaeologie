
##################
##      WICHTIG   ##
##################

nicht das Feld "address" verwenden, sondern immer "location" !!!!


##################
##      To do   ##
##################
	
- -> Abkürzungsverzeichnis für shortjournal-Zeitschriftentitel?!?  x-)
	-->LCB: gute Idee
vgl. http://www.latex-community.org/forum/viewtopic.php?f=5&t=690

- ein "et. al." / u.a. fehlt, oder wird nicht mehr angezeigt?!?!
- Klammerregelung für DAI-Zitation: in runden Klammern weitere Klammern eckig setzen --> (LIMC V [1990] 108 Nr. 2767 s. v. Herakles [J. Boardmann – G. Kokkorou-Alewras])

- Feld "Volume" bei (beispw.) Book wird nicht ausgelesen!??!

--> URL auslesen nur bei "online" oder PhD

##########################
##      DAI-Implementierung   ##
##########################

Für Festschrift/Ausstellungskatalog/Auktionskatalog ist das Feld "Titleaddon" zu nutzen, dann klappt es!


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



(2015-06-15) --> Einträge mit unbekannten Autoren/Editoren:, --> Datensatz-Eintrag "options = {unbekannt}", "shorthand = {key}". 
		==> In Anmerkungen wird Shorthand und Jahr in [] gesetzt und so auch dann wieder in Bibliographie ausgegeben: 
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


(2015-06-04)  Befindet sich ein \citeauthor{BibtexKey} innerhalb einer Fußnote, wird automatisch(!) nur der Nachname ausgegeben, bleibt aber zum Literaturverzeichnis referenziert.


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


	über die Option "shortjournal=true" kann man nun nur die im Feld "shortjournal" eingetragenen Kurzbezeichnungen auslesen lassen. Wenn das Feld "shortjournal" nicht belegt ist, wird automatisch das Feld "journal" ausgelesen.

##############
## Optional ##
##############

--> Die Rezensionen sind nicht gut gelöst. Alles ist in das Titelfeld gepackt, obwohl man es mit crossref verlinken könnte.

	==> LCB: jetzt kann man Autor, Titel. Subtitle, Erscheinungsjahr vom rezensierten Werk automatisch über crossref anzeigen und verknüpfen lassen ->  ist kein crossref-Eintrag vorhanden, wird der Titel von @review ausgelesen.
Die Verknüpfung zum rezensierten Werk funktioniert nur, WENN das rezensierte Werk  ebenfalls in der Bibliographie ist- sonst wird nur der Titel der Rezension angzeigt. (Daran könnte und sollte man noch arbeiten)

	==> Problem ist die Darstellung in den Fußnoten. Da wird trotz eigener Rezensionstitel der subtitle des rezensierten Werks angegeben...



############
## Gelöst ##
############


--> Abkürzungen von Zeitschriften: 

--> Nach \cite-Befehl erfolgt nun keine Fussnote automatisch (\DeclareCiteCommand{\cite}). Gefahr besteht noch bei Erstzitaten (sofern wir das behalten). Diese würden nun auch im Fließtext voll ausgeschrieben werden.

--> Reihenfolge von Vor- und Nachname bei Hrsg-Angabe tauschen.
	bislang: , in: Bossert, Lukas (Hrsg.) --> gewünscht: , in: L. Bossert (Hrsg.)

--> publisher ist Teil des Vollzitats
	JF: Nochmals Änderung in \newbibmacro*{location+edition+year} vorgenommen. Da hatte sich noch ein Fehler eingeschlichen (bei fehlendem Verlagsort).

--> Es gibt jetzt auch eine reine Autor-Jahr-Option ohne shorttitle. Ist vielleicht mal ganz praktisch das noch zusätzlich zu haben. Man muss nur unter den biblatex-Optionen kurztitel=true setzen.

--> Volume wurde bei Zeitschriften nicht ausgelesen, geschichtsfrkl liest nur Number aus. Habe Volume ergänzt. Zudem noch die Klammern bei der Jahreszahl entfernt (DAI). Stimmt dann auch bei Review.

--> Ort, Verlag, Jahr sowie Erstauflage in Klammern, Reihentitel und -nummern nun mit Kommata an den Buchtitel gehängt.