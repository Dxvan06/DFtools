#!/bin/bash

# Array of tools to check and install
tools=("sleuthkit" "autopsy" "wireshark" "volatility-tools" "foremost" "dc3dd" "libimage-exiftool-perl" "bulk-extractor" "caine" "osforensics")

# Function to check if a tool is installed
check_tool() {
    if command -v $1 &> /dev/null
    then
        echo "$1 is already installed."
    else
        echo "$1 is not installed. Attempting to install..."
        sudo apt-get update && sudo apt-get install -y $1
        sudo apt install regripper -y $1
        git clone https://github.com/volatilityfoundation/volatility3.git $1
    fi
}

# Loop through the tools and check/install them
for tool in "${tools[@]}"
do
    check_tool $tool
done

echo "All tools have been checked and necessary installations attempted."
