#!/bin/bash
# This code was fully generated using ChatGPT at https://chat.openai.com/
# Check if exactly two arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required. Usage: $0 <directory> <search_string>"
    exit 1
fi

filesdir=$1
searchstr=$2

# Check if the first argument is a valid directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi

# Find number of files (regular files only)
file_count=$(find "$filesdir" -type f | wc -l)

# Find number of matching lines across all files
match_count=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Output result
echo "The number of files are $file_count and the number of matching lines are $match_count"

exit 0
