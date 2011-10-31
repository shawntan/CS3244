#!/bin/bash
J="java -cp /usr/share/java/weka/weka.jar"
TESTFILE="Formatting/train.arff"
#$J weka.classifiers.bayes.NaiveBayes	-x 10	-t $TESTFILE -d models/NaiveBayes.default > results/NaiveBayes.default
tests=(
	'lazy.IBk'
	'lazy.IBk -K 5'
	'lazy.IBk -K 10'
	'lazy.IBk -K 50'
	'lazy.IBk -K 100'
	'functions.SMO'
	'bayes.NaiveBayes'
	'bayes.NaiveBayes -K'
)
tests_length=${#tests[@]}
for (( i=0; i<${tests_length}; i++ ));
do
	echo ${tests[i]}
	$J weka.classifiers.${tests[i]} -t $TESTFILE -d models/${tests[i]//[[:space:]]} -x 10 > results/${tests[i]//[[:space:]]}
	echo "Results for ${tests[i]//[[:space:]]}"
	tail results/${tests[i]//[[:space:]]}
done;

#$J weka.classifiers.	-t $TESTFILE -d models/IBk.default > results/IBk.default
#$J weka.classifiers.		-x 10 	-t $TESTFILE -d models/IBk.k5 > results/IBk.k5

#$J weka.classifiers. 		-x 10	-t $TESTFILE -d models/SMO.default > results/SMO.default
#tail results/NaiveBayes.k5
