OUT_FOLDER = out
FILENAME = OParl-1.0-draft
SRC_FOLDER = src
IMAGE_FOLDER = src/images/
IMAGES = $(wildcard $(IMAGE_FOLDER)/*.pdf)
PNG_IMAGES = $(IMAGES:.pdf=.png)
# pandoc muss im src Ordner ausgeführt werden, damit die Pfadangaben der eingebundenen Bilder stimmen
PANDOC_COMMAND = cd $(SRC_FOLDER); pandoc --from markdown --standalone --table-of-contents --number-sections
LATEX_ENGINE = pdflatex
LATEX_TEMPLATE = resources/template.tex

.PHONY: all html pdf odt docx txt epub common_dependencies clean

all: html pdf odt docx txt epub

html: common_dependencies $(PNG_IMAGES) 
	$(PANDOC_COMMAND) --to html5 --section-divs --self-contained \
	    -o ../$(OUT_FOLDER)/$(FILENAME).html *.md

pdf: common_dependencies
	$(PANDOC_COMMAND) --latex-engine=$(LATEX_ENGINE) \
	    --template ../$(LATEX_TEMPLATE) -o ../$(OUT_FOLDER)/$(FILENAME).pdf *.md

odt: common_dependencies $(PNG_IMAGES)
	$(PANDOC_COMMAND) -o ../$(OUT_FOLDER)/$(FILENAME).odt *.md

docx: common_dependencies $(PNG_IMAGES)
	$(PANDOC_COMMAND) --metadata toc-title:"Inhaltsverzeichnis" \
	    -o ../$(OUT_FOLDER)/$(FILENAME).docx *.md

txt: common_dependencies
	$(PANDOC_COMMAND) -o ../$(OUT_FOLDER)/$(FILENAME).txt *.md

epub: common_dependencies $(PNG_IMAGES)
	$(PANDOC_COMMAND) -o ../$(OUT_FOLDER)/$(FILENAME).epub *.md


$(IMAGE_FOLDER)/%.png: $(IMAGE_FOLDER)/%.pdf
	gs -dQUIET -dSAFER -dBATCH -dNOPAUSE -sDisplayHandle=0 -sDEVICE=png16m -r600 \
	    -dTextAlphaBits=4 -sOutputFile=$@ -f $<

common_dependencies: $(OUT_FOLDER) $(SRC_FOLDER)/schema.md

$(OUT_FOLDER):
	 mkdir -p $(OUT_FOLDER);

$(SRC_FOLDER)/schema.md: scripts/json_schema2markdown.py schema/ examples/
	python scripts/json_schema2markdown.py schema/ examples/ > $@

clean:
	rm -rf $(OUT_FOLDER)
	rm $(SRC_FOLDER)/schema.md
	rm $(IMAGE_FOLDER)/*.png

