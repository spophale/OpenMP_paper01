ALL_FILES = $(wildcard *.tex)  $(wildcard *.bib)  $(wildcard */*.png) 

MAIN = main
TARGET = $(MAIN).pdf

.PHONY:	all	tidy	clean

all: $(TARGET)

$(TARGET): 	$(ALL_FILES)
	pdflatex $(MAIN)
	bibtex $(MAIN)
	pdflatex $(MAIN)
	pdflatex $(MAIN)
	make tidy

tidy:
	rm -f *.aux */*.aux
	rm -f *.bbl */*.bbl
	rm -f *.log */*.log
	rm -f *.blg */*.blg
	rm -f *.out */*.out

clean:	tidy
	rm -f $(MAIN).pdf
