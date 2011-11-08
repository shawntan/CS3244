#!/bin/bash
echo "\\section{Uncertain Instances}\\label{unsure}" > report/unsure_files.tex
for s in $(grep '0 $' output | sed 's/^ *//g' | cut -d ' ' -f 1);
do
	FILE_NO=$(head -n $s 5Newsgroups/output/list_test.txt | tail -n 1)
	echo "\subsubsection*{File Number: $FILE_NO}" >> report/unsure_files.tex
	echo "\\scriptsize\\begin{verbatim}" >> report/unsure_files.tex
	cat 5Newsgroups/test/$FILE_NO >> report/unsure_files.tex
	echo "\\end{verbatim}" >> report/unsure_files.tex
done;

