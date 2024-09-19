# free space of your hard disks and warns you when that free space drops below a given threshold. 
# the value of threshold is given by the user. If no value is given default value is used as threshold

#!/bin/bash
set -e
#Define threshold value
PERCENT=10

#check whether threshold is provided
if [ $# -le 0 ]
then
   printf "using default value for threshold!\n"
else
   if [[ $1 =~ ^_?[0-9]+([0-9]+)?$ ]]
   then
         PERCENT = $1
   fi
fi

# let PERCENT += 0
# printf "THRESHOLD = %d\n" "$PERCENT"

df -Ph | grep -vE '^Filesystem|cdrom|tmpfs' | awk '{ print $5, $1 }' | while read data;
do 
used=$(echo $data | awk '{ print $1 }' | sed s/%//g)
p=$( echo $data | awk '{ print $2 }')
if [ $used -ge $PERCENT ] 
then 
   echo " \"$p\" has reached its Threshold=$PERCENT at date=$(date)"
fi
done