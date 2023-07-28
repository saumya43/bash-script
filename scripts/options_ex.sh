#!/bin/bash

#this file helps you to understand how to create options in bash. this file is simply creating any number of directory on remote machine directory on remote machine provided by command line and one file is deleting those directories.
#when query returns non-zero , e flag stops the script
set -e
scriptName="${0##*/}"
#creating logfile
LOGFILE="${scriptName%.*}.log"
function logsetup {
    TMP=$(tail -n $RETAIN_NUM_LINES $LOGFILE 2>/dev/null) && echo "${TMP}" > $LOGFILE
    exec > >(tee -a $LOGFILE)
}

function log {
    echo "[$(date --rfc-3339=seconds)]: $*"
}
logsetup

#variable
DEFAULT_SSH_KEY="~/.ssh/ubuntu_server"
REMOTE_IP="172.16.10.124"

function printusage(){
     cat <<EOF
Synopsis
    $scriptName [-c] dir1 dir2 | $scriptName [-r] directory1 directory2
    create or delete directory
    -c  create directory

    -r remove directory
        
    -h help
        Print help information
EOF
}

function create_directory(){
   echo "create directory $@"
}
function remove_directory(){
   echo "remove directory" 
}
#defining options
while getopts "cr" option; do
   case "$option" in 
       c) create_directory; exit 1 ;;
       r) remove_directory; exit 1 ;;
       h) printusage; exit 1 ;;
       *) printusage; exit 1 ;;
    esac
done 
shift $((OPTIND - 1))

if [ "$#" == "0" ];then
   printusage
   exit 1
fi