#!/bin/bash


if [[ "$(id -u)" -ne 0 ]]; then 
    echo "Giving script sudo priviledges"
    sudo -E "$0" "$@"
    exit
fi

base_dir="/home/zenitugo/fun-with-linux2/Linux-Grok"
new_dir="new_folder1"
file1="$new_dir/note1.txt"
file2="$new_dir/note2.txt"


# Check if base directory exist or not
if [[ -d "$base_dir" ]]; then
    echo "base directory exist"
    
else
    echo "base directory does not exist"
    mkdir -p "$base_dir"
fi


# CD into base directory
cd "$base_dir" || exit 1


# Function to create directory
create_dir() {
    if [[ -d "$new_dir" ]]; then
        echo "New directory exist" 
    else
        echo "Creating new directory"
        mkdir "$new_dir" || exit 1
    fi
}

# Function to create files in this new directory
create_files() {
    if [[ -f "$file1" ]]; then
        echo "file1 exist"
    else  
        echo "Creating file1"
        touch "$file1" || exit 1
    fi

    if [[ -f "$file2" ]]; then
        echo "file2 exist"
    else  
        echo "Creating file2"
        touch "$file2" || exit 1
    fi
}

create_dir
create_files

echo "Created directory and files"