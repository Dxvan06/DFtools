#!/bin/bash

# Array of tools to check and install with their package names or install methods
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

# Check and install tools available via apt-get
for tool in "${!tools[@]}"
do
    check_tool $tool
done

# Special handling for tools not available via apt-get

# Install RegRipper
install_regripper() {
    if [ -d "/usr/local/regripper" ]; then
        echo "RegRipper is already installed."
    else
        echo "RegRipper is not installed. Attempting to install..."
        sudo apt-get update
        sudo apt-get install -y unzip libparse-win32registry-perl
        wget https://github.com/keydet89/RegRipper3.0/archive/refs/heads/master.zip -O regripper.zip
        unzip regripper.zip
        sudo mv RegRipper3.0-master /usr/local/regripper
        sudo chmod +x /usr/local/regripper/*.*
        rm regripper.zip
        echo "RegRipper installed successfully."
    fi
}

install_regripper

echo "All tools have been checked and necessary installations attempted."
