#!/bin/bash
set -e
df -Ph | grep -vE '^Filesystem|tmpfs'| tr -s ' ' | cut -d' ' -f1,5 | sed 's/%//g'| while read data;
do
used=$( echo $data | awk '{print $2}')
disk=$( echo $data | awk '{print $1}')
if (( used > 9 ));
then
    echo -e "\e[0;31mWARNING:\e[0m threshold is has been reached for disk $disk: $used"
else
    echo "$disk: $used"
fi
done