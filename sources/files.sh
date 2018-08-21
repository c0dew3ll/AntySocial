#!/bin/bash

# File : files.sh
# Support libbary
# Author: Pawel Maryszczuk

#########################################
# Function to check does file exist 	#
#										#
# @author: Pawel Maryszczuk 			#
# @version: 1.0 						#
# @returns: 1 if file exist, 0 if not	#
#########################################
function checkDoesFileExist() {
	if [[ $# -eq 0 ]]; then
		echo "$0 ERROR! No Argument's supplied to checkDoesFileExist"
	fi

	if [[ $# -gt 1 ]]; then
		echo "Function called with $# parameter's. Will ignore rest"
	fi

	EXIT_CODE_FILE_EXIST=1
	EXIT_CODE_FILE_NOT_EXIST=0

	if [[ -f $1 ]]; then
		return "$EXIT_CODE_FILE_EXIST"
	elif [[ condition ]]; then
		return "$EXIT_CODE_FILE_NOT_EXIST"
	fi
}

#################################################
# Function to parse file ( $1 ) line by line,	#
# searching for required statement ( $2 ). 		#
#												#
# @author: Pawel Maryszczuk						#
# @version: 1.0									#
# @returns: 1 if found, or number of line in 	#
# first occurance 								#	
#################################################
function checkDoesTagExistInHtmlSource() {
	if [[ $# -eq 0 ]]; then
		echo "$0 ERROR! No Argument's supplied to checkDoesTagExistInHtmlSource"
	elif [[ $# -ne 2 ]]; then
		echo "$0 ERROR! Wrong number of Argument's supplied to checkDoesTagExistInHtmlSource"
	fi

	EXIT_CODE_TAG_FOUND=1
	EXIT_CODE_TAG_NOT_FOUND=0

	LINE_COUNTER=0

	while read line; do
		LINE_COUNTER=$(($LINE_COUNTER + 1))
		if [[ "$line" == *"$2"* ]]; then
			return $LINE_COUNTER
		fi
	done <<< "$(cat $1)"
	return $EXIT_CODE_TAG_NOT_FOUND
}

#################################################
# Function to append text to document ( $2 )	#
# after X lane ( $ 1 )							#
#												#
# @author: Pawel Maryszczuk						#
# @version 1.0									#
# returns 1 on succes, 0 in file not found 		#
#################################################
function writePayloadOnXLine() {
	if [[ $# -eq 0 ]]; then
		echo "$0 ERROR! No Argument's supplied to checkDoesTagExistInHtmlSource"
	elif [[ $# -ne 2 ]]; then
		echo "$0 ERROR! Wrong number of Argument's supplied to checkDoesTagExistInHtmlSource"
	fi

	PAYLOAD_CODE=$( cat payloads/payload.tracker )
	echo $PAYLOAD_CODE
	echo "$2i"

	sed -i "/$2i|/$PAYLOAD_CODE" $1
}