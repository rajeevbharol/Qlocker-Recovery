#!/bin/bash
#`7z e IMG_20180103_145734163_HDR.jpg.7z -pZAMwQKyHG482TFVjkcbYpPr5nz3DSCEe`


CMD=/usr/local/sbin/7z

# Make a list of all directories under root and put in a file
file='all_dirs.txt' 
find ./ -type d  > $file 

# If these are found in the file name replace these chars with _ in the logic below
declare weirdchars=" )(&\'"

# Go through all directories in that file

i=1  
count=0
while read line;
    do  
        #Reading each line  
        #echo "Line No. $i : $line"  

        search_dir=$line

        for the_file in "$search_dir"/*
            do

                echo "============> Found file $the_file" 
                count=$((count+1))

            done
i=$((i+1))  
done < $file  
echo "Found $count files"

