#!/bin/bash

# Modify /etc/apt/preferences.d/pop-default-settings
sudo tee /etc/apt/preferences.d/pop-default-settings > /dev/null << EOF
Package: *
Pin: release o=pop-os-release
Pin-Priority: 500
EOF

echo "File /etc/apt/preferences.d/pop-default-settings modified successfully."

# Create new file /etc/apt/preferences.d/kde-backports-pin
sudo tee /etc/apt/preferences.d/kde-backports-pin > /dev/null << EOF
Package: *
Pin: release o=LP-PPA-kubuntu-ppa-backports,n=jammy,l=Kubuntu Backports
Pin-Priority: 1001

Package: *
Pin: release o=LP-PPA-kubuntu-ppa-backports-extra,n=jammy,l=Kubuntu Backports Extra
Pin-Priority: 1001
EOF

echo "File /etc/apt/preferences.d/kde-backports-pin created successfully."

# Add the Kubuntu Backports PPAs
sudo add-apt-repository ppa:kubuntu-ppa/backports
sudo add-apt-repository ppa:kubuntu-ppa/backports-extra

# Update package lists and perform full upgrade
sudo apt update
sudo apt full-upgrade

# Adjust priorities back to original values
sudo tee /etc/apt/preferences.d/pop-default-settings > /dev/null << EOF
Package: *
Pin: release o=pop-os-release
Pin-Priority: 1001
EOF

sudo tee /etc/apt/preferences.d/kde-backports-pin > /dev/null << EOF
Package: *
Pin: release o=LP-PPA-kubuntu-ppa-backports,n=jammy,l=Kubuntu Backports
Pin-Priority: 500

Package: *
Pin: release o=LP-PPA-kubuntu-ppa-backports-extra,n=jammy,l=Kubuntu Backports Extra
Pin-Priority: 500
EOF

echo "Priorities in /etc/apt/preferences.d/ files adjusted back to original values."

# Print a message about potential reboot
echo "To ensure all changes take effect, it's recommended to reboot your system."

# Prompt for reboot
read -p "Would you like to reboot now? (y/n): " answer

if [[ $answer =~ ^[Yy]$ ]]; then
    # Initiate reboot
    sudo reboot
else
    echo "Reboot postponed. Please remember to reboot at your earliest convenience."
