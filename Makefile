LATEX = latexmk

.PHONY: all homotopy analysis-group clean distclean

all: homotopy analysis-group fun-analysis

analysis-group: analysis-group/analysis-group.pdf
fun-analysis: fun-analysis/fun-analysis.pdf
homotopy: homotopy/homotopy.pdf
lattice-models: lattice-models/lattice-models.pdf

%.pdf: %.tex preambule.tex
	# @echo "*: $*"
	# @echo "@: $@"
	# @echo "<: $<"
	$(LATEX) -cd -pdf -quiet $<


clean:
	@for d in */*.tex *.tex; do latexmk -quiet -cd $$d -c &&  echo "cleaned aux for '$$d'"; done;

distclean:
	@for d in */*.tex *.tex; do latexmk -quiet -cd $$d -CA &&  echo "cleaned all generated files for '$$d'"; done;

