#!/bin/bash
# This file will remove unwanted characters and spaces from directory names for all directories within root directory.
# Windows sometimes add those chars and spaces in the names.
# sanitizing directory names ensures that 7z script doesn't fail
# This script should be the first one to run 

# Target directory (defaults to current directory)
TARGET_DIR="${1:-.}"

# Find and sort directories by descending depth to avoid rename conflicts
find "$TARGET_DIR" -depth -type d | while IFS= read -r dir; do
    base=$(basename "$dir")
    parent=$(dirname "$dir")

    # Clean the directory name: replace space, (, ), [, ], .
    clean_base="${base//[ .\'()\[\]]/_}"

    # Skip if the cleaned name is the same
    if [[ "$base" == "$clean_base" ]]; then
        continue
    fi

    new_dir="$parent/$clean_base"

    # Rename the directory
   if [[ $dir != "." ]]; then
       echo "Renaming:"
       echo "  Old: $dir"
       echo "  New: $new_dir"
 
       mv "$dir" "$new_dir"
    fi
    
done

