#!/bin/bash

# This will remove unwanted chars from all 7z files so that 7z script doesn't fail
# This should be run after sanitize_dirs script

# Root directory (defaults to current directory if not given)
ROOT="${1:-.}"

# Recursively find all files
find "$ROOT" -type f | while IFS= read -r filepath; do
    dir=$(dirname "$filepath")
    base=$(basename "$filepath")

    # Separate the last two extensions (e.g. .jpg.7z)
    filename="${base%.*.*}"
    ext1="${base##*.}"                  # e.g. 7z
    ext2_tmp="${base%.*}"              # e.g. abc.jpg
    ext2="${ext2_tmp##*.}"             # e.g. jpg

    # If the file doesn't have two extensions, skip
    if [[ "$filename" == "$base" ]]; then
        #echo "Skipping (not enough extensions): $filepath"
        continue
    fi

    # Sanitize the filename part
    clean_name="$filename"
    clean_name="${clean_name// /_}"      # spaces
    clean_name="${clean_name//./_}"      # dots
    clean_name="${clean_name//\'/_}"     # single quote
    clean_name="${clean_name//[()]/_}"   # round brackets
    clean_name="${clean_name//[\[\]]/_}" # square brackets

    # Construct new filename with preserved last two extensions
    newbase="${clean_name}.${ext2}.${ext1}"
    newpath="${dir}/${newbase}"

    # Rename only if the new name is different
    if [[ "$filepath" != "$newpath" ]]; then
        echo "Renaming:"
        echo "  From: $filepath"
        echo "  To  : $newpath"
        mv "$filepath" "$newpath"
    fi
done

