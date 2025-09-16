#!/bin/bash
#         `7z e IMG_20180103_145734163_HDR.jpg.7z -pZAMwQKyHG482TFVjkcbYpPr5nz3DSCEe`



# Make a list of all directories under root and put in a file
file='all_dirs.txt'  
find ./ -type d  > $file 

#parse that file
  
i=0  
file_count=0
while read line;
    do  
        #Reading each line  
        #echo "Line No. $i : $line"  

        search_dir=$line

        echo "Found Dir at line $i : $search_dir Working on it"  

        for the_file in "$search_dir"/*
            do
                #echo Direc: "$search_dir"
                #echo File : "$the_file"

                if [[ $the_file == *.7z ]] 
                    then
                        echo "Found 7z file $the_file in the dir $search_dir" 
                        7z e $the_file -o$search_dir -pZAMwQKyHG482TFVjkcbYpPr5nz3DSCEe -y &> /dev/null
			if [[ $? -ne 0 ]]; then
                           echo "7z extraction failed!"
                           # handle error here (exit, retry, log, etc.)
                        else  
                            echo File : "Recovered: $the_file"
			    rm -f $the_file
			    file_count=$((file_count+1))
			fi
                fi
             done

i=$((i+1))  
done < $file  
echo "Recovered a total of $file_count files in $i directories"
