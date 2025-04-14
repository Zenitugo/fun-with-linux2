#!/bin/bash
dir="linux_learning/week1/"
dir1="text_files"
dir2="scripts"



# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" >&2
    exec sudo "$0" "$@"
    exit 1
fi


# Checks if directory exist
if [ -d $dir ]; then
        echo "directory exist"
else
    mkdir -p $dir 
fi     

cd $dir && mkdir dir1 dir2

