#!/bin/bash

CMD=/usr/local/sbin/7z

# Make a list of all directories under root and put in a file
file='all_dirs.txt' 
find ./ -type d  > $file 

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
                #echo File : "$the_file"

                if [[ $the_file == *.7z ]];
                    then
                        echo "============> Found 7z file $the_file" 
                        count=$((count+1))

                fi
            done
i=$((i+1))  
done < $file  
echo "Found $count 7z files"

