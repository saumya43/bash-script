#!/bin/bash
file=~/bash_basics/bash-script/file1.txt
while read -n 1 c
do
   echo "$c"
done < $file | grep '[[:alpha:]]' | sort | uniq -c | sort -nr

