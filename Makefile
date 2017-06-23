texfiles := $(wildcard *.tex)

all: $(texfiles:.tex=.pdf)

.PHONY: FORCE
%.pdf: %.tex FORCE
	./latexrun $<

.PHONY: clean
clean:
	./latexrun --clean-all
