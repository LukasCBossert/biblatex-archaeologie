MAKE  = make
PROJECT = $(PFX)$(NAME)
NAME  = archaeologie
NAMEtypeout = $(CYAN)*** $(NAME) ***$(NC)
BIB   = $(NAME)
PFX   = biblatex-
SHELL = bash
PWD   = $(shell pwd)
TEMP := $(shell mktemp -d -t tmp.XXXXXXXXXX)
TDIR  = $(TEMP)/$(NAME)
VERS  = $(shell /bin/date "+%Y-%m-%d---%H-%M-%S")
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
# Colors
RED   = \033[0;31m
CYAN  = \033[0;36m
NC    = \033[0m
echoPROJECT = @echo -e "$(CYAN) <$(PROJECT)>$(RED)"

.PHONY:  all clean cleanall zip install uninstall files
# Just create the PDF
all: $(NAME).pdf
	@echo -e 	$(echoPROJECT) "* everything is up to date * $(NC)"
	@exit 0

# How to create the PDF
$(NAME).pdf: $(NAME).dtx
	latexmk  -lualatex -f $(NAME).dtx

# just create the files without pdf
files: $(NAME).ins
	latex $(NAME).ins

$(NAME).ins:
	lualatex $(NAME).dtx

# clean all temporary files
clean:
	rm -f {$(NAME),$(BIB)}.{sectionbibs.aux,thm,bibexample,biographies.aux,xdv,aux,mw,bbl,bcf,blg,doc,fdb_latexmk,fls,glo,gls,hd,idx,ilg,ind,listing,log,nav,out,run.xml,snm,synctex.gz,toc,vrb}
	rm -f $(NAME).markdown.{in,lua,out}
	rm -f *.{log,aux}
	rm -rf _markdown_*
	$(echoPROJECT) "* cleaned temp files * $(NC)"


# clean all files
cleanbundle: clean
	rm -f *.{{b,c,d,l}bx,ins,pdf,zip,bib}
	$(echoPROJECT) "* cleaned all files * $(NC)"


# zip files up for sending etc.
ctan: all
	rm -f $(NAME)*.zip
	mkdir $(TDIR)
	cp $(NAME).{dtx,pdf} README.md Makefile $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)
	$(echoPROJECT) "* files zipped * $(NC)"

# install in your local TEX folder
install: all
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(PFX)$(NAME)
	sudo mkdir -p $(LOCAL)/bibtex/bib/$(PFX)$(NAME)
	sudo cp $(NAME).{dtx,ins} $(LOCAL)/source/latex/$(PFX)$(NAME)
	sudo cp $(BIB).{b,c,d}bx {english,german,italian,french,spanish}-$(NAME).lbx $(LOCAL)/tex/latex/$(PFX)$(NAME)
	sudo cp $(NAME).pdf $(LOCAL)/doc/latex/$(PFX)$(NAME)
	sudo cp $(NAME)-*.bib $(LOCAL)/bibtex/bib/$(PFX)$(NAME)
	sudo mktexlsr
	$(echoPROJECT) "* all files installed * $(NC)"


uninstall:
	sudo rm -r $(LOCAL)/{tex,source,doc}/latex/$(PFX)$(NAME)
	sudo rm -r $(LOCAL)/bibtex/bib/$(PFX)$(NAME)
	sudo mktexlsr
	$(echoPROJECT) "* all files uninstalled * $(NC)"
