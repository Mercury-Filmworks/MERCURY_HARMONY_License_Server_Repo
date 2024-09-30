#!/bin/bash

# Set the file path
machinelist=""
# Set variable for Nabu
nabuloc=""

if [[ -d "/mnt/Nabu/" ]]; then
    nabuloc="/mnt/Nabu/"
elif [[ -d "/mnt/nabu/" ]]; then
    nabuloc="/mnt/nabu"
else
    echo "Nabu mount needed"
    exit 0
fi

echo "Nabu mount found in $nabuloc"
# Check if the machine list file exists
# Loop through machine list

# Check if the flex file exist and read if hermes is available
