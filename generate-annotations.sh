#!/usr/bin/bash

get_format_diff () {
	echo $1 $2 $3
	clang-format $1 > $2
	diff -u $1 $2 > $3
	echo $3
}

DIR="./hello"

for file in $DIR/*.c; do

	echo $file
	FILE_IN=$file
	FILE_OUT=$file-formatted.c
	DIFF_LOG=$FILE_IN-diff.log

	get_format_diff $FILE_IN $FILE_OUT $DIFF_LOG

	cat $DIFF_LOG
	DIFF_TEXT=`cat $DIFF_LOG`
	echo $DIFF_TEXT
	DIFF_TEXT="${DIFF_TEXT//'%'/'%25'}"
	DIFF_TEXT="${DIFF_TEXT//$'\n'/'%0A'}"
	DIFF_TEXT="${DIFF_TEXT//$'\r'/'%0D'}"
	LINE=`cut -sd "@" -f3 $DIFF_LOG | cut -d "," -f2 | cut -f1 -d " "`
	echo "::error file=$file,line=$LINE,col=1::$DIFF_TEXT"

done

#TODO: split diff files into smaller chunks
