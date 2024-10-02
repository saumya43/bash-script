#!/bin/bash

set -e
echo "hello"
Directory="/home/ubuntu/bash_basics/bash-script/dir:/home/ubuntu/bash_basics/bash-script/directory_new"
while read -d ":" Dir;
do
    count=`find $Dir -type f | wc -l`
    echo $count
    if [[ count -gt 4 ]]
    then
      echo "there are more files than threshold in $Dir: $count"
      recipient="saumya043@gmail.com"
      subject="RE:threshole reached"
      body="threshold is reached $Dir: $count"
      echo "$body" | mail -s "$subject" "$recipient"
    else
      echo "Everything is fine in dir $Dir: $count"
    fi
done <<< "$Directory:"

