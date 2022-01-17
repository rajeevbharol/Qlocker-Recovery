#!/bin/bash

# PW variable contains the password to your 7z file. Replace this string with your password
PW=ZANwQKyHG482TFVjkcbYpPr5nz3DSCEe

CMD=/usr/local/sbin/7z

# Make a list of all directories under root and put in a file
file='all_dirs.txt' 
find ./ -type d  > $file 

# Go through all directories in that file

i=1  
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

                        the_file_without_extn="${the_file%.*}"

                        echo "basename: $the_file_without_extn" 

                        if [[ -f "$the_file_without_extn" ]]; 
                            then
                                echo "Deleting already extracted file $the_file"
                                rm -f "$the_file"
                            else
                                echo "Need to Extract File..trying" 
                                $CMD e "$the_file" -o"$search_dir" -p$PW 1> /dev/null

                        fi
                 fi

                 if [[ $the_file == *!!!READ_ME.txt ]]
                     then
                         echo "Getting rid of hackers message"
                         rm -f $the_file
                 fi
            done
i=$((i+1))  
done < $file  

