#!/bin/bash
ORIG_DIR=$(pwd)
cd chi_fse
php fs.php
php fe.php
cd $ORIG_DIR 
cd Formatting
FEATURECOUNT=$(grep -c "^" ../5Newsgroups/output/all_keywords.txt)
expect -c ' 
spawn wine Formatting.exe
expect {
	"Please input the number of features (Enter):" { send "'$FEATURECOUNT'\r"; exp_continue}
	"Done." { send "\n"}
}
exit
'
cd $ORIG_DIR


