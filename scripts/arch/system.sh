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

# Install packages
sudo pacman -Syu --noconfirm
# Assume cwd is the dotfiles directory
sudo pacman -S --noconfirm - < ./scripts/inventory/arch.txt

# Set default shell to zsh if needed
sudo chsh -s /bin/zsh "$USERNAME"

# Print completion message
echo "System setup completed."
