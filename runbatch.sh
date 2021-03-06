#!/bin/bash
J="java -cp /usr/share/java/weka/weka.jar"
TESTFILE="Formatting/train.arff"
KERNEL=""
#$J weka.classifiers.bayes.NaiveBayes	-x 10	-t $TESTFILE -d models/NaiveBayes.default > results/NaiveBayes.default
tests=(
#	'lazy.IBk'
#	'lazy.IBk -K 5'
#	'lazy.IBk -K 10'
#	'lazy.IBk -K 20'
#	'lazy.IBk -K 30'
#	'lazy.IBk -K 50'
#	'lazy.IBk -K 20 -W 3000'
#	'lazy.IBk -K 100'
#	'lazy.IBk -K 10 -I'
#	'lazy.IBk -K 20 -I'
#	'lazy.IBk -K 10 -F'
#	'lazy.IBk -K 20 -F'
#	'functions.SMO'
#	'functions.SMO -K "weka.classifiers.functions.supportVector.PolyKernel -E 0.5"'
#	'functions.SMO -K "weka.classifiers.functions.supportVector.PolyKernel -E 1.5"'
#	'functions.SMO -K "weka.classifiers.functions.supportVector.PolyKernel -E 2.0"'
#	'functions.SMO -K "weka.classifiers.functions.supportVector.PolyKernel -E 3.0"'
#	'functions.SMO -K "weka.classifiers.functions.supportVector.PolyKernel -E 0.5 -L"'
#	'functions.SMO -K "weka.classifiers.functions.supportVector.PolyKernel -E 1.5 -L"'
#	'functions.SMO -K "weka.classifiers.functions.supportVector.PolyKernel -E 2.0 -L"'
#	'functions.SMO -K "weka.classifiers.functions.supportVector.PolyKernel -E 3.0 -L"'
#	'functions.SMO -K "weka.classifiers.functions.supportVector.PolyKernel -E 4.0 -L"'
#	'functions.SMO -K "weka.classifiers.functions.supportVector.RBFKernel"'       
#	'bayes.NaiveBayes'
#	'bayes.NaiveBayes -K ' 
)
tests_length=${#tests[@]}
for (( i=0; i<${tests_length}; i++ ));
do
	echo "Doing ${tests[i]}"
	SAVE_FILE=${tests[i]//[[:space:]]}
	SAVE_FILE=${SAVE_FILE//\"}
	EXEC_STR="$J weka.classifiers.${tests[i]} -t $TESTFILE -d models/$SAVE_FILE -x 10 > results/$SAVE_FILE -i"
	eval $EXEC_STR
	echo "Results for $SAVE_FILE" 
	tail -n -20 results/$SAVE_FILE | head -n 10
done;

#$J weka.classifiers.	-t $TESTFILE -d models/IBk.default > results/IBk.default
#$J weka.classifiers.		-x 10 	-t $TESTFILE -d models/IBk.k5 > results/IBk.k5

#$J weka.classifiers. 		-x 10	-t $TESTFILE -d models/SMO.default > results/SMO.default
#tail results/NaiveBayes.k5
