#!/bin/bash
set -e 
echo "Enter Threshold of memory"
read -p "THRESHOLD: " THRESHOLD
echo $THRESHOLD
memUsage=$(free | grep Mem | awk '{ print $3/$2 * 100.0 }' | cut -d"." -f1)
echo $memUsage 
if (( THRESHOLD > memUsage ));
then
    echo -e "\e[0;31mWARNING:\e[0m Memory is used above threshold"
else
    echo "memory usage is below threshold"
fi