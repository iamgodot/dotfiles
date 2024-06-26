#!/bin/bash

# Check if USERNAME environment variable is set
if [ -z "$USERNAME" ]; then
  echo "Error: USERNAME environment variable is not set."
  exit 1
fi

# Create new user if it doesn't already exist
if ! id "$USERNAME" &>/dev/null; then
  sudo useradd -m -s /bin/bash "$USERNAME"
  passwd "$USERNAME"
  echo "User $USERNAME created."
else
  echo "User $USERNAME already exists!"
fi

# Set default shell to zsh if needed
sudo chsh -s /bin/zsh "$USERNAME"

# Install yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay
# TODO: Install yay packages from yay.txt

# Remove pre-installed login manager
sudo pacman -Rs sddm

# Set up ssh
ssh-keygen -t rsa -b 4096
