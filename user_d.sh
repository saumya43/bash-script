#!/bin/bash
set -e
help(){
    cat << EOF
        $0 [options][value]
        -a $USER_NAME: enter the user name to added in the file
        -d $USER_NAME: enter the Username to be deleted
EOF
}

while getopts ':a:d:h' opt; do
    case $opt in 
        h)
        help
        exit 1
        ;;
        a)
        echo "Add user: $OPTARG"
        ;;
        d)
        echo "delete user: $USER_NAME"
        ;;
        *)
        help
        exit 1
        ;;
        
    esac
done

shift $((OPTIND-1))

if [[ $# -eq 0 ]] ;
then
    help
fi
