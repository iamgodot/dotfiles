#!/bin/bash

# Check if USERNAME environment variable is set
if [ -z "$USERNAME" ]; then
  echo "Error: USERNAME environment variable is not set."
  exit 1
fi

# Run as created user
if [ "$EUID" -eq 0 ]; then
  sudo -u "$USERNAME" bash -c "$0"
  exit
fi

../bootstrap.sh

# Print completion message
echo "User setup completed."
