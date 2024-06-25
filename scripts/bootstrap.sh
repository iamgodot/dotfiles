#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"
CONFIGS_DIR="$HOME/.config"

create_folders() {
    for name in alacritty zsh tmux starship git
    do
        mkdir -p $CONFIGS_DIR/$name
    done
    mkdir -p $HOME/.ipython/profile_default/startup
}

setup_dotfiles () {
    ln -si $DOTFILES_DIR/alacritty/alacritty.toml $CONFIGS_DIR/alacritty/alacritty.toml
    ln -si $DOTFILES_DIR/zsh/zshrc.symlink $HOME/.zshrc
    ln -si $DOTFILES_DIR/tmux/tmux.conf.symlink $HOME/.tmux.conf
    ln -si $DOTFILES_DIR/nvim $CONFIGS_DIR/nvim
    ln -si $DOTFILES_DIR/starship/starship.toml $CONFIGS_DIR/starship.toml
    ln -si $DOTFILES_DIR/ipython/ipython_config.py $HOME/.ipython/profile_default/ipython_config.py
    ln -si $DOTFILES_DIR/ipython/startup/utils.py $HOME/.ipython/profile_default/startup/utils.py
}

setup_gitconfig () {
    echo 'Setting up git config files now.'
    echo 'What is your github author name?'
    read -e git_author_name
    echo 'What is your github author email?'
    read -e git_author_email
    sed -e "s/AUTHORNAME/$git_author_name/g" -e "s/AUTHOREMAIL/$git_author_email/g" $DOTFILES_DIR/git/gitconfig.local.symlink.example > $DOTFILES_DIR/git/gitconfig.local.symlink
    ln -si $DOTFILES_DIR/git/gitconfig.symlink $HOME/.gitconfig
    ln -si $DOTFILES_DIR/git/gitconfig.local.symlink $HOME/.gitconfig.local
    ln -si $DOTFILES_DIR/git/gitmessage.symlink $HOME/.gitmessage
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
