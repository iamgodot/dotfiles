#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
CONFIGS_DIR="$HOME/.config"

create_folders() {
    for name in alacritty zsh tmux starship git doom
    do
        mkdir -p $CONFIGS_DIR/$name
    done
    mkdir -p $HOME/.ipython/profile_default/startup
}

setup_dotfiles () {
    rm -rf $CONFIGS_DIR/hypr
    mkdir -p ~/.config/hypr && stow -d arch -t ~/.config/hypr hypr
    mkdir -p ~/.config/waybar && stow -d arch -t ~/.config/waybar waybar
    stow -t ~ zsh tmux wezterm
    stow -t ~/.config starship
    stow -t ~/.config/doom doom
    mkdir -p ~/.config/nvim && stow -t ~/.config/nvim nvim
    stow -t ~/.ipython/profile_default ipython
}

setup_gitconfig () {
    echo 'Setting up git config files now.'
    echo 'What is your github author name?'
    read -e git_author_name
    echo 'What is your github author email?'
    read -e git_author_email
    sed -e "s/AUTHORNAME/$git_author_name/g" -e "s/AUTHOREMAIL/$git_author_email/g" $DOTFILES_DIR/git/.gitconfig.local.example > $DOTFILES_DIR/git/.gitconfig.local
    stow git
    echo 'Finished git config setup.'
}

setup_other () {
    # Install zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
    # Install tmux plugin manager
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

create_folders
setup_dotfiles
setup_gitconfig
setup_other
