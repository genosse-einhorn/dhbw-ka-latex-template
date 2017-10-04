texfiles := $(wildcard *.tex)
dotfiles := $(wildcard img/*.dot)
svgfiles := $(wildcard img/*.svg)

all: $(texfiles:.tex=.pdf)

.PHONY: FORCE
%.pdf: %.tex $(dotfiles:.dot=.pdf) $(svgfiled:.svg=.pdf) FORCE
	./latexrun --latex-cmd=xelatex $<

%.pdf: %.dot
	dot -Tpdf -Gmargin=0 -o $@ $<

%.pdf: %.svg
	inkscape -f $< -A $@

.PHONY: clean
clean:
	./latexrun --clean-all
