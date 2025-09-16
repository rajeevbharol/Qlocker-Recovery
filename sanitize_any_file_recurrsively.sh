#!/bin/bash
#
# After recovery script has run, 7z puts the files to original names with spaces and chars..
# Run this script optionally if you want file names without chars and spaces

# Root directory (defaults to current directory if not given)
ROOT="${1:-.}"

# Recursively find all files
find "$ROOT" -type f | while IFS= read -r filepath; do
    dir=$(dirname "$filepath")
    base=$(basename "$filepath")

    # Separate the last two extensions (e.g. .jpg.7z)
    filename="${base%.*}"
    ext1="${base##*.}"                  # e.g. 7z

    # Sanitize the filename part
    clean_name="$filename"
    clean_name="${clean_name// /_}"      # spaces
    clean_name="${clean_name//./_}"      # dots
    clean_name="${clean_name//\'/_}"     # single quote
    clean_name="${clean_name//[()]/_}"   # round brackets
    clean_name="${clean_name//[\[\]]/_}" # square brackets

    # Construct new filename
    newbase="${clean_name}.${ext1}"
    newpath="${dir}/${newbase}"

    # Rename only if the new name is different
    if [[ "$filepath" != "$newpath" ]]; then
        echo "Renaming:"
        echo "  From: $filepath"
        echo "  To  : $newpath"
        mv "$filepath" "$newpath"
    fi
done

