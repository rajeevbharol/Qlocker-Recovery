#!/bin/bash
# Acts on files iwthin a directory and changes the file names so it must be run in each dir
# it changes "abc (1) sd.jpg.7z" to "abc__1__sd_jpg.7z"
# So it makes second extension jpg part of the file name. To fix it, get clue from 
# the file sanitize_7z_files_recurrsively.sh 

TARGET_DIR="${1:-.}"

# Loop over files (non-recursive)
find "$TARGET_DIR" -maxdepth 1 -type f | while IFS= read -r filepath; do
    base=$(basename "$filepath")
    dir=$(dirname "$filepath")

    # Save original name for comparison
    original_name="$base"

    # Remove and replace characters using Bash string replacement
    clean_name="${base// /_}"   # spaces
    clean_name="${clean_name//[()]/_}"  # parentheses
    clean_name="${clean_name//[\[\]]/_}"  # square brackets
    clean_name="${clean_name//./_}"  # dots (ALL dots, including in extensions)

    # If you want to preserve the final extension, split the name first:
    # Uncomment below if needed:
    name="${base%.*}"
    ext="${base##*.}"
    clean_name="${name//[ .()\[\]]/_}.${ext}"

    newfile="$dir/$clean_name"

    if [[ "$filepath" != "$newfile" ]]; then
        echo "Renaming:"
        echo "  Old: $filepath"
        echo "  New: $newfile"
        mv "$filepath" "$newfile"
    fi
done

