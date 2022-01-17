#!/bin/bash
#`7z e IMG_20180103_145734163_HDR.jpg.7z -pZAMwQKyHG482TFVjkcbYpPr5nz3DSCEe`


CMD=/usr/local/sbin/7z
PW=ZANwQKyHG482TFVjkcbYpPr5nz3DSCEe

# Make a list of all directories under root and put in a file
file='all_dirs.txt' 
find ./ -type d  > $file 

# If these are found in the file name replace these chars with _ in the logic below
declare weirdchars=" !)=(&\'"

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

                        new_file_name="${the_file//[${weirdchars}]/_}"

                        [[ ! -a "$new_file_name" ]] &&  \
                        mv -f "$the_file" "$new_file_name" && the_file=${new_file_name} 

                        echo new file: $new_file_name

                        the_file_without_extn="${the_file%.*}"

                        echo "basename: $the_file_without_extn" 

                        if [[ -f "$the_file_without_extn" ]]; 
                            then
                                echo "Deleting already extracted file $the_file"
                                rm -f "$the_file"
                            else
                                echo "Need to Extract File..trying" 
                                $CMD e "$the_file" -o"$search_dir" -p$PW 1> /dev/null
                                if [ $? -ne 0 ]
                                    then
                                        echo "failed to extract"
                                    else
                                        echo success remove file!
                                        rm -f "$the_file"
                                fi

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

