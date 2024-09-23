#!/bin/bash

# Function to check for errors
check_error() {
    if [ $? -ne 0 ]; then
        echo "Error occurred in $1"
        exit 1
    fi
}

# Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y
check_error "Updating system"

# Install common software
echo "Installing common software..."
sudo apt install -y \
    git \
    vim \
    curl \
    build-essential \
    gnome-tweaks \
    neofetch \
    htop \
    wget \
    software-properties-common
check_error "Installing common software"

# Add repositories (e.g., for latest versions of software)
echo "Adding additional repositories..."
sudo add-apt-repository ppa:deadsnakes/ppa -y
check_error "Adding repositories"

# Install programming languages and tools
echo "Installing programming languages..."
sudo apt install -y \
    python3 \
    python3-pip \
    nodejs \
    npm \
    openjdk-11-jdk
check_error "Installing programming languages"

# Install additional applications
echo "Installing additional applications..."
sudo apt install -y \
    vlc \
    gimp \
    firefox \
    libreoffice \
    code \
    slack-desktop \
    discord
check_error "Installing additional applications"

# Clean up
echo "Cleaning up unnecessary packages..."
sudo apt autoremove -y
check_error "Cleaning up"

# Enable firewall
echo "Enabling firewall..."
sudo ufw enable
check_error "Enabling firewall"

# Configure Git
echo "Configuring Git..."
git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"
check_error "Configuring Git"

# Set up a custom prompt
echo "Setting up custom prompt..."
echo 'export PS1="\[\e[0;32m\]\u@\h \[\e[0;34m\]\w\[\e[0;31m\]\$ \[\e[0m\]"' >> ~/.bashrc
source ~/.bashrc
check_error "Setting up custom prompt"

# Display system info
echo "Deployment completed!"
neofetch
