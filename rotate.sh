#The presented bash script will help you to rotate a log file after exceeding a defined file size
#!/bin/bash
set -e 

f=/home/ubuntu/sysLog/syslog.bac
if [[ ! -f $f ]]
then
    echo "file does not exit"
    exit
fi
touch ${f}
maxsize=$((4096))
size=`du -b ${f} | tr -s '\t' ' ' | cut -d' ' -f1`
echo $size
if [[ ${size} -gt ${maxsize} ]]
then 
    echo "rotating file"
    timestamp=`date +%s`
    mv ${f} ${f}.$timestamp
    touch ${f}
fi
