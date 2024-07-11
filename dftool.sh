#!/bin/bash

# Array of tools to check and install with their package names
declare -A tools=(
    ["sleuthkit"]="sleuthkit"
    ["autopsy"]="autopsy"
    ["wireshark"]="wireshark"
    ["volatility"]="volatility-tools"
    ["foremost"]="foremost"
    ["dc3dd"]="dc3dd"
    ["exiftool"]="libimage-exiftool-perl"
    ["bulk_extractor"]="bulk-extractor"
    # ["caine"]="caine" # Not directly installable from apt-get
    # ["osforensics"]="osforensics" # Not directly installable from apt-get
)

# Function to check if a tool is installed
check_tool() {
    if command -v $1 &> /dev/null
    then
        echo "$1 is already installed."
    else
        echo "$1 is not installed. Attempting to install ${tools[$1]}..."
        sudo apt-get update && sudo apt-get install -y ${tools[$1]}
    fi
}

# Loop through the tools and check/install them
for tool in "${!tools[@]}"
do
    check_tool $tool
done

echo "All tools have been checked and necessary installations attempted."
