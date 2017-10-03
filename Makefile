texfiles := $(wildcard *.tex)

all: $(texfiles:.tex=.pdf)

.PHONY: FORCE
%.pdf: %.tex FORCE
	./latexrun --latex-cmd=xelatex $<

.PHONY: clean
clean:
	./latexrun --clean-all
