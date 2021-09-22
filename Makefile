LATEX = latexmk

.PHONY: all homotopy analysis-group clean distclean

all: homotopy analysis-group

analysis-groups: analysis-group/analysis-group.pdf
homotopy: homotopy/homotopy.pdf

%.pdf: %.tex preambule.tex
	# @echo "*: $*"
	# @echo "@: $@"
	# @echo "<: $<"
	$(LATEX) -cd -pdf -quiet $<


clean:
	@for d in */*.tex *.tex; do latexmk -quiet -cd $$d -c &&  echo "cleaned aux for '$$d'"; done;

distclean:
	@for d in */*.tex *.tex; do latexmk -quiet -cd $$d -CA &&  echo "cleaned all generated files for '$$d'"; done;

