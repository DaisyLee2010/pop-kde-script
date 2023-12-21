#!/bin/bash

read -p "This is a community-provided solution to swap from Gnome to KDE on pop_OS. This is not sanctioned or supported by System76 and all risk is on you. Do you wish to continue? (Yes/No): " -n 1 -r
echo   # Move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Exiting script."
  exit 1
fi

# Update package lists for latest information
sudo apt update

# Install the packages
sudo apt install -y \
  dolphin dolphin-plugins kio-fuse kio-extras kwin-x11 kde-plasma-desktop \
  xdg-desktop-portal-kde xdg-user-dirs ark systemsettings print-manager \
  plasma-widgets-addons plasma-thunderbolt plasma-systemmonitor plasma-runner-installer \
  plasma-discover plasma-discover-backend-flatpak plasma-discover-backend-fwupd \
  plasma-pa plasma-nm plasma-browser-integration powerdevil kscreen \
  kde-config-sddm kde-config-systemd kde-config-screenlocker kde-config-gtk-style \
  kde-config-sddm sddm sddm-theme-breeze kimageformat-plugins libreoffice-kde \
  libreoffice-qt5 libreoffice-plasma plasma-browser-integration kwin-bismuth \
  kmenuedit okular gwenview kdeconnect

# Remove pop-desktop (including essential packages)
sudo apt remove pop-desktop --allow-remove-essential

# Uninstall GNOME packages
sudo apt remove -y \
  baobab eog evince geary gedit gnome-calculator gnome-calendar gnome-contacts \
  gnome-font-viewer gnome-power-manager gnome-weather gucharmap \
  xdg-desktop-portal-gnome xdg-user-dirs-gtk adwaita-icon-theme-full \
  gnome-control-center gnome-disk-utility gnome-system-monitor gnome-terminal \
  language-selector-gnome nautilus nautilus-sendto network-manager-pptp-gnome \
  network-manager-openvpn-gnome gnome-shell totem seahorse gdm3 
  
# Install System76 packages
sudo apt install -y \
  system76-wallpapers system76-pop-theme system76-pop-fonts system76-firmware pop-shop  
  
  # Reboot the system
sudo reboot
