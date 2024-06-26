# Godot's Dotfiles

![Arch](https://img.shields.io/badge/Arch%20Linux-1793D1?logo=arch-linux&logoColor=fff&style=for-the-badge)
![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)

This repo contains my personal dotfiles and setup scripts for my Arch and MacOS.

It's easy to get trapped into rabbit holes for tools like Nix, after some thoughts I decided to keep it simple with shell scripts and Makefile which are just enough to suit my needs.

I try to make things atomic in order to run them by part, such as for installing packages or bootstrapping dotfiles, which are all listed out in the Makefile.

It most likely won't work for you yet I believe can be a good reference if what you're looking for is GTD over fancy stuff.

## Usage

```bash
# Clone this repo
git clone https://github.com/iamgodot/dotfiles.git ~/.dotfiles

# Check out commands from Makefile
make

# Run Makefile accordingly, e.g. after installing Arch I would
make arch
```

For details of Arch installation&setup, check [here](./arch/README.md).

## Contributing

For any questions or suggestions, feel free to open an issue.
