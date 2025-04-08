#!/bin/bash

# aaayafuj-instagram-hacking.sh - Secure Version with VPN Connection

# Function to check if Windscribe is installed
check_windscribe_installed() {
    if ! command -v windscribe &> /dev/null; then
        echo "Windscribe VPN is not installed. Installing..."
        install_windscribe
    else
        echo "Windscribe VPN is already installed."
    fi
}

# Function to install Windscribe VPN
install_windscribe() {
    echo "Installing Windscribe VPN..."
    
    # For Ubuntu/Debian-based systems
    if [[ "$(uname -s)" == "Linux" ]]; then
        echo "Detected Linux system, checking distribution..."
        
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            if [[ "$ID" == "ubuntu" ]] || [[ "$ID" == "debian" ]]; then
                echo "Installing Windscribe for Ubuntu/Debian..."
                sudo apt update
                sudo apt install -y gdebi
                wget https://download.windscribe.com/desktop/deb/windscribe-cli.deb
                sudo gdebi windscribe-cli.deb -n
                rm windscribe-cli.deb
            fi
        fi
    fi

    # Additional installation steps can be added for other systems (e.g., Arch, Fedora, etc.)
}

# Function to login to Windscribe VPN
login_to_vpn() {
    echo "Logging into Windscribe VPN..."
    
    # Check if login credentials are set
    if [[ -z "$WINDSCRIBE_USERNAME" ]] || [[ -z "$WINDSCRIBE_PASSWORD" ]]; then
        echo "No VPN credentials provided. Exiting."
        exit 1
    fi
    
    # Perform VPN login
    windscribe login "$WINDSCRIBE_USERNAME" "$WINDSCRIBE_PASSWORD"
    
    # Connect to a VPN server (e.g., USA)
    echo "Connecting to Windscribe VPN..."
    windscribe connect USA
    if [ $? -ne 0 ]; then
        echo "VPN connection failed. Exiting."
        exit 1
    else
        echo "VPN is connected successfully."
    fi
}

# Function to check if the VPN is connected
check_vpn_connection() {
    if ! windscribe status | grep -q "Connected"; then
        echo "VPN is not connected. Trying to connect..."
        login_to_vpn
    else
        echo "VPN is already connected."
    fi
}

# Function to protect the script from tampering
protect_script() {
    SCRIPT_PATH=$(realpath $0)  # Get the path of the currently running script
    MD5_HASH=$(md5sum $SCRIPT_PATH | awk '{ print $1 }')

    # Compare the current script's hash with the authorized hash (stored securely)
    AUTHORIZED_HASH="f7c3bc1d808e04732adf679965ccc34ca7ae3441"  # Example MD5 hash of the original script
    if [[ "$MD5_HASH" != "$AUTHORIZED_HASH" ]]; then
        echo "Script has been tampered with. Exiting."
        exit 1
    fi
}

# Function to start the Instagram hacking tool after VPN connection
run_instagram_tool() {
    echo "Running Instagram hacking tool..."
    
    # Your tool logic goes here (e.g., cloning the repository, setting up dependencies, etc.)
    # For example, we can start the Instagram hacking tool here:
    # cd /path/to/your/tool
    # ./start_instagram_hacking_tool.sh
    
    # Placeholder for the actual Instagram hacking functionality
    echo "Instagram hacking tool is running securely with VPN protection!"
}

# Main function to execute everything
main_execution() {
    # Protect the script from tampering
    protect_script
    
    # Check if VPN is installed and log in
    check_windscribe_installed
    
    # Check VPN connection status
    check_vpn_connection
    
    # Run Instagram tool only after VPN connection
    run_instagram_tool
}

# Run the main function
main_execution
