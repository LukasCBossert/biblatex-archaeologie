alles, was hier nicht mehr drin steht, wurde schon in "archaeologie.tex" verarbeitet

##################
##    PROBLEME  ##
##################


- ein "et. al." / u.a. fehlt, oder wird nicht mehr angezeigt?!?!
- Feld "Volume" bei (beispw.) Book wird nicht ausgelesen!??!
- Die Rezensionen sind (noch) nicht (gut) gelöst




##################
##    WICHTIG   ##
##################

nicht das Feld "address" verwenden, sondern immer "location" !!!!


##################
##      To do   ##
##################
	
- -> Abkürzungsverzeichnis für shortjournal-Zeitschriftentitel?!?  x-)
	-->LCB: gute Idee
vgl. http://www.latex-community.org/forum/viewtopic.php?f=5&t=690




--> URL auslesen nur bei "online" oder PhD

##################
##     altes    ##
##################



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





--> Abkürzungen von Zeitschriften: 

--> Nach \cite-Befehl erfolgt nun keine Fussnote automatisch (\DeclareCiteCommand{\cite}). Gefahr besteht noch bei Erstzitaten (sofern wir das behalten). Diese würden nun auch im Fließtext voll ausgeschrieben werden.

--> Reihenfolge von Vor- und Nachname bei Hrsg-Angabe tauschen.
	bislang: , in: Bossert, Lukas (Hrsg.) --> gewünscht: , in: L. Bossert (Hrsg.)

--> publisher ist Teil des Vollzitats
	JF: Nochmals Änderung in \newbibmacro*{location+edition+year} vorgenommen. Da hatte sich noch ein Fehler eingeschlichen (bei fehlendem Verlagsort).

--> Es gibt jetzt auch eine reine Autor-Jahr-Option ohne shorttitle. Ist vielleicht mal ganz praktisch das noch zusätzlich zu haben. Man muss nur unter den biblatex-Optionen kurztitel=true setzen.

--> Volume wurde bei Zeitschriften nicht ausgelesen, geschichtsfrkl liest nur Number aus. Habe Volume ergänzt. Zudem noch die Klammern bei der Jahreszahl entfernt (DAI). Stimmt dann auch bei Review.

--> Ort, Verlag, Jahr sowie Erstauflage in Klammern, Reihentitel und -nummern nun mit Kommata an den Buchtitel gehängt.