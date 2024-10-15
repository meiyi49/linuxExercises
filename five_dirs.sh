#!/bin/bash
# Create the main directory "five"
mkdir -p five

# Loop to create five subdirectories (dir1 to dir5)
for i in {1..5}
do
    # Create subdirectory dir$i
    mkdir -p five/dir$i
    
    # Loop to create 4 files (file1 to file4) in each subdirectory
    for j in {1..4}
    do
        # Create file$j in dir$i
        file_path="five/dir$i/file$j"
        
        # Write the digit j into the file j times
        for k in $(seq 1 $j)
        do
            echo $j >> "$file_path"
        done
    done
done
