#!/bin/bash

# Array of tools to check and install with their package names or install methods
declare -A tools=(
    ["sleuthkit"]="sleuthkit"
    ["autopsy"]="autopsy"
    ["wireshark"]="wireshark"
    ["foremost"]="foremost"
    ["dc3dd"]="dc3dd"
    ["exiftool"]="libimage-exiftool-perl"
    ["bulk_extractor"]="bulk-extractor"
    ["regripper"]="regripper"
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

# Install Volatility
install_volatility() {
    if [ -d "/usr/local/volatility3" ]; then
        echo "Volatility 3 is already installed."
    else
        echo "Volatility 3 is not installed. Attempting to install..."
        sudo apt-get update
        sudo apt-get install -y git python3 python3-pip
        git clone https://github.com/volatilityfoundation/volatility3.git
        sudo mv volatility3 /usr/local/volatility3
        sudo pip3 install -r /usr/local/volatility3/requirements.txt
        echo "Volatility 3 installed successfully."
    fi
}

# Install Volatility 3
install_volatility

echo "All tools have been checked and necessary installations attempted."
