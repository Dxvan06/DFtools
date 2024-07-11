#!/bin/bash

# Create dftools directory if it doesn't exist
install_dir="$HOME/DFtools/volatility"
mkdir -p $install_dir

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
    local tool_name=$1
    local tool_package=${tools[$1]}
    local tool_install_path="$install_dir/$tool_name"

    if command -v $tool_name &> /dev/null
    then
        echo "$tool_name is already installed."
    else
        echo "$tool_name is not installed. Attempting to install $tool_package..."
        sudo apt-get update && sudo apt-get install -y $tool_package
        if [ $? -eq 0 ]; then
            echo "$tool_name installed successfully."
        else
            echo "Failed to install $tool_name."
            return 1
        fi
    fi
}

# Check and install tools available via apt-get
for tool in "${!tools[@]}"
do
    check_tool $tool || exit 1
done

# Special handling for tools not available via apt-get

# Install Volatility 3
install_volatility() {
    local tool_name="volatility"
    local tool_package="volatility3"
    local tool_install_path="$install_dir/$tool_name"

    if [ -d "$tool_install_path" ]; then
        echo "Volatility 3 is already installed."
    else
        echo "Volatility 3 is not installed. Attempting to install..."
        sudo apt-get install -y git python3 python3-pip
        git clone https://github.com/volatilityfoundation/volatility3.git $tool_install_path
        sudo pip3 install -r $tool_install_path/requirements.txt
        echo "Volatility 3 installed successfully."
    fi
}

# Install Volatility 3
install_volatility

echo "All tools have been checked and necessary installations attempted."
