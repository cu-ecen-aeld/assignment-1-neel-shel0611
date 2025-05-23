#!/bin/bash

# This code was fully generated using ChatGPT at https://chat.openai.com/

if [ $# -ne 2 ]; then
    echo "Error: Two arguments required. Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Extract directory path from the full file path
dirpath=$(dirname "$writefile")

# Create the directory path if it doesn't exist
mkdir -p "$dirpath"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create directory path '$dirpath'"
    exit 1
fi

# Write the string to the file (overwriting if it exists)
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Failed to write to file '$writefile'"
    exit 1
fi

exit 0
