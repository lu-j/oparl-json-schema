#!/usr/bin/env bash

# Erzeugt Derivate vom Master-Dokument (Markdown-Format in /dokument/master/)
# in verschiedenen Ausgabeformaten

FILENAME="OParl-1.0"

SOURCE="*.md"
DOC_FOLDER="../out"

LATEX_ENGINE="pdflatex"

FORMAT=markdown

# Erzeugt die Tabellen und Beispiele für das Datenmodell Kapitel
python scripts/json_schema_to_markdown_tables.py schema/ examples/ > src/datenmodell.md

cd src
rm -rf $DOC_FOLDER/*
mkdir -p $DOC_FOLDER/

# HTML5
echo "HTML single document"
pandoc -t html5 --self-contained -s -N -o $DOC_FOLDER/$FILENAME.htm -f $FORMAT $SOURCE

echo "HTML with linked images"
mkdir -p $DOC_FOLDER/html
pandoc -t html5 -s -N -o $DOC_FOLDER/html/$FILENAME.html $FORMAT $SOURCE
cd $DOC_FOLDER
zip -rq $FILENAME-HTML.zip html/
cd ../src

# DocBook
echo "DocBook"
mkdir -p $DOC_FOLDER/docbook
pandoc -t docbook -o $DOC_FOLDER/docbook/$FILENAME.xml -f $FORMAT $SOURCE
cd $DOC_FOLDER
zip -rq $FILENAME-DocBook.zip docbook/
cd ../src

# epub
echo "EPub"
pandoc -t epub -o $DOC_FOLDER/$FILENAME.epub -f $FORMAT $SOURCE

# Word .docx
echo "DOCX"
pandoc --table-of-contents --metadata toc-title:"Inhaltsverzeichnis" -t docx -o $DOC_FOLDER/$FILENAME.docx -f $FORMAT $SOURCE

# plain text
echo "Plain-Text"
mkdir -p $DOC_FOLDER/plain
pandoc --table-of-contents -t plain -o $DOC_FOLDER/plain/$FILENAME.txt -f $FORMAT $SOURCE

# pdf
has_tex=$(which $LATEX_ENGINE)
if [ $? -eq 0 ]
then
  echo "LaTeX"
  pandoc --latex-engine=$LATEX_ENGINE --table-of-contents --template ../resources/template.tex -N -o $DOC_FOLDER/$FILENAME.pdf -f $FORMAT $SOURCE
fi
