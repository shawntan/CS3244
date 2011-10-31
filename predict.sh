#!/bin/bash
J="java -cp /usr/share/java/weka/weka.jar"
MODELS=models/*
echo "$(grep -c "^\{" Formatting/test.arff) test.arff"
cp 5Newsgroups/output/list_test.txt output
wc -l 5Newsgroups/output/list_test.txt

EXEC_STR="$J weka.classifiers.meta.Vote -t Formatting/train.arff -R MAJ" 

for raw in $MODELS;
do
	f=$(basename $raw)
#	$J weka.classifiers.${f%%-*} -T Formatting/test.arff -l $raw -p 0 | tail -n +6 | tr -s ' ' | cut -d ' ' -f 4 | sed 's/^[0-9]://g' | head -n -1> classes
	EXEC_STR="$EXEC_STR  -P $raw " #-B weka.classifiers.${f%%-*}
	#echo "$(wc -l classes)  for $raw"
	#paste -d ':' output classes > output1
	#mv output1 output
done
$EXEC_STR 
#tail results/*
