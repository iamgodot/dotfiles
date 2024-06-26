# Arch Linux

## Installation

1. Prepare installation medium

On MacOS, check the flash drive device and unmount it:

```bash
# Let's say device is /dev/disk4
diskutil list

diskutil unmountDisk /dev/disk4
```

Then write the image file in it:

```bash
sudo dd if=/path/to/iso of=/dev/disk4 bs=4M status=progress
```

2. Install Arch

Boot from the installation medium and execute in the terminal:

```bash
# Connect to the internet first
iwctl --passphrase $PASSWORD station wlan0 connect $SSID

# Check if have ip address
ip addr show

# Install via the script
archinstall
```

For the prompts, check the following:jj

- Disk configuration: use a best-effort default -> ext4 -> yes
- Profile: desktop -> Hyprland
  - Login manager: sddm
- Audio: Pipewire
- Additional packages: git
- Network configration: NetworkManager

When it's done, reboot and unplug the installation medium.

## Setup

First connect to the internet:

```bash
nmcli device wifi connect $SSID password $PASSWORD
```

Then clone this repo and run the setup script:

```bash
git clone https://github.com/iamgodot/dotfiles.git ~/.dotfiles

make arch
```

Better to reboot for a full refresh.

## Manual steps

- Tmux plugin: `prefix + I`
- Neovim plugins: open and installation will start automatically
- Firefox: login and sync
- Bitwarden: login and sync
- Open `fcitx5-configtool` to add and activate `rime-ice-pinyin-git`
- Add ssh public key to Github
