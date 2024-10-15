#!/bin/bash
# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <dir> <n>" 1>&2
    exit 1
fi

# Assign arguments to variables
dir=$1
n=$2

# Check if the first argument is a valid directory
if [ ! -d "$dir" ]; then
    echo "Error: $dir is not a directory" 1>&2
    exit 1
fi

# Find and remove files larger than n bytes in the specified directory
find "$dir" -type f -size +"$n"c -exec rm {} \;
