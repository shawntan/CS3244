#!/bin/bash
J="java -cp /usr/share/java/weka/weka.jar"
$J weka.classifiers.meta.Vote -T Formatting/test.arff -l THEMODEL -p 0 > output
cat output | tail -n +6 | tr -s ' ' | cut -d ' ' -f 4  > classes1
cat classes1 | sed 's/^[0-9]://g' | head -n -1> classes

#$J weka.classifiers.meta.Vote -T Formatting/train.arff -l THEMODEL
paste -d ':' 5Newsgroups/output/list_test.txt classes > prediction.txt
