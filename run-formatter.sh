#!/usr/bin/bash

FILE_IN=./hello/hello.c
FILE_OUT=./hello/hello-formatted.c
DIFF_LOG=$FILE_IN-diff.log

clang-format $FILE_IN > $FILE_OUT
diff -u $FILE_IN $FILE_OUT > $DIFF_LOG
echo $DIFF_LOG

#TODO: split diff file into smaller chunks
