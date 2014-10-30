#!/bin/sh
BASEDIR=$(dirname $0)
cd $BASEDIR
cd ..

# Build the dissertation.
xelatex dissertation
bibtex dissertation
xelatex dissertation
xelatex dissertation

# Hide the log.
mv "dissertation.log" ".logged"

# Remove temporary files.
for TYPE in "*.log" "*.aux" "*.toc" "*.blg" "*.bbl" "*.out" "*.brf" "*.tex-e" "*.lof" "*.lot" "*.loa"
do
  rm `find ./ -name $TYPE` -rf
done

cd dissertation/chapters
rm `find ./ -name "*.aux"` -rf
cd ..

cd dissertation/endmatter
rm `find ./ -name "*.aux"` -rf
cd ..