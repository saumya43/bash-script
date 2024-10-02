#!/bin/bash
set -e 

help(){
    echo "provide value a and value b"
}
while getopts ':a:b:h' opt; do
    case $opt in 
    a)
    echo "$OPTARG"
    ;;
    b) 
    echo "$OPTARG"
    ;;
    h)
    help
    exit 1
    ;;
    *) 
    echo "invalid value -$OPTARG" >&2;
    help 
    exit 1
    ;;
    \?) 
    echo "Invalid option -$OPTARG" >&2;
    help 
    exit 1
    ;;
esac
done

    shift $((OPTIND-1))

    if [ $OPTIND -eq 1 ]; then
    help
    exit 1
fi 