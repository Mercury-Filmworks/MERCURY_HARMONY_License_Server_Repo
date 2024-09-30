#!/bin/bash

# Set the location of the flexlm file
flexlmloc="/usr/local/flexlm/licenses/license.dat"

# Check if license file exist in the machine
if [[ ! -f $flexlmloc ]]; then
    echo "License file doesn't exist!"
    exit 0
fi

# Reading the license file and check if Hermes exists
if grep -q "hermes2" "$flexlmloc"; then # if hermes2 already exist then close the script
    echo "hermes2 is already set nothing to do here!"
    exit 0
fi

if grep -q "hermes" "$flexlmloc"; then # if hermes exist replace with hermes2
    echo "Backing up license file... "
    datenow=$(date +"%Y%m%d.%H%M")
    cp -v "$flexlmloc" "$flexlmloc.Backup.$datenow"

    echo "Replacing hermes to hermes2..."
    
    # Use sed to replace hermes to hermes2 in the flexlm file.
    sed -i 's/hermes/hermes2/g' "$flexlmloc"
    echo "Replacement done!"
else
    echo "hermes doesnt exist in the file."
fi