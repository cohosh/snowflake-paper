PDFLATEX = max_print_line=10000 pdflatex -halt-on-error -file-line-error -interaction=nonstopmode
BIBTEX = bibtex

FIGURES = \
	figures/rendezvous/rendezvous.pdf \
	figures/users-global/users-global.pdf

snowflake.pdf: *.tex *.bib $(FIGURES)

%.pdf: %.tex
	rm -f "$*.aux" "$*.bbl"
	$(PDFLATEX) -draftmode "$*"
	$(BIBTEX) "$*"
	$(PDFLATEX) -draftmode "$*"
	$(PDFLATEX) "$*"

.PHONY: clean
clean:
	rm -rf $(addprefix snowflake,.aux .ent .log .pdf .bbl .blg .out)

.DELETE_ON_ERROR:
