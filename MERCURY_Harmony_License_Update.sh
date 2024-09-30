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

# Setting machine list
$machinelist="$nabuloc/toonboom/ToonBoom_Linux/lnx_script_lib/machine_list.csv"

# Check if machine list exists
if [[ ! -f $machinelist ]]; then
    echo "Machine list doesn't exist."
    exit 0
fi

echo "Nabu mount found in $nabuloc"
# Check if the machine list file exists
# Loop through machine list

# Check if the flex file exist and read if hermes is available
