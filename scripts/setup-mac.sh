#!/bin/bash

# Set default shell to zsh if needed
sudo chsh -s /bin/zsh "$USERNAME"

# Set up ssh
ssh-keygen -t rsa -b 4096
