#!/bin/sh
# pwd = print working directory
pwd
pwd -L
pwd -P
# find command you want to run
which cron
ls 
locate cron

#more info about files
echo "show info about files"
ls -l /tmp/sample.file
echo "to see stat of file"
stat /tmp/sample.file
echo "use file command"
file /tmp/sample.file

#showing hidden file 
echo "show all hidden files in directory"
ls -a /tmp