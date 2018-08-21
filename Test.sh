#!/bin/bash

# Loading sources

source sources/files.sh

#########################
# files.sh test cases	#
#########################

### Function checkDoesFileExist should rertrn
### 1 if file exist, and 0 if file does not exist
#
# Setup

touch testfile
checkDoesFileExist testfile
retval=$?

if [[ $retval -eq 1 ]]; then
	echo "checkDoesFileExist			OK"
elif [[ $retval -eq 0 ]]; then
	echo " checkDoesFileExist			FAILED. Didn't found file."
else
	echo " checkDoesFileExist			FAILED. Unknown return code."
fi

#Cleanup
rm testfile

### Function checkDoesTagExistInHtmlSource() should return 1
### when lane is equal to search term
#
# Setup
echo "OOMG>" >> testfile
echo "OOMG>" >> testfile
echo "OOMG>" >> testfile
echo "OOMG>" >> testfile
echo "<body>" >> testfile
checkDoesTagExistInHtmlSource testfile "<body>"
retval=$?

if [[ $retval -eq 5 ]]; then
	echo "checkDoesTagExistInHtmlSource		OK"
elif [[ $retval -ne 5 ]]; then
	echo "checkDoesTagExistInHtmlSource		FAILED. Tag not found."
fi

# Cleanup
rm testfile

