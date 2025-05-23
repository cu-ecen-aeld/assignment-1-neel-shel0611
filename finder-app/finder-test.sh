#!/bin/bash
# This code was fully generated using ChatGPT at https://chat.openai.com/ 
# Set default values if not provided
numfiles=${1:-10}
writestr=${2:-"AELD_IS_FUN"}

# Read username from conf/username.txt
username=$(cat conf/username.txt)

# Check if username is empty
if [ -z "$username" ]; then
    echo "Error: Could not read username from conf/username.txt"
    exit 1
fi

# Create /tmp/aeld-data directory
rm -rf /tmp/aeld-data
mkdir -p /tmp/aeld-data

# Generate files using writer.sh
for i in $(seq 1 $numfiles); do
    filepath="/tmp/aeld-data/${username}${i}.txt"
    ./writer.sh "$filepath" "$writestr"
    if [ $? -ne 0 ]; then
        echo "Error: writer.sh failed for $filepath"
        exit 1
    fi
done

# Run finder.sh and capture output
output=$(./finder.sh /tmp/aeld-data "$writestr")
expected_output="The number of files are $numfiles and the number of matching lines are $numfiles"

# Compare output
if [ "$output" = "$expected_output" ]; then
    echo "success"
    exit 0
else
    echo "error"
    echo "Expected: $expected_output"
    echo "Got: $output"
    exit 1
fi
