#!/bin/bash

#echo 'Existing config files will be backed up using `ln -b`.'

ln -si $HOME/.dotfiles/zsh/zshrc.symlink $HOME/.zshrc
ln -si $HOME/.dotfiles/tmux/tmux.conf.symlink $HOME/.tmux.conf
mkdir -p $HOME/.config/nvim
ln -si $HOME/.dotfiles/nvim/init.vim.symlink $HOME/.config/nvim/init.vim
ln -si $HOME/.dotfiles/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
mkdir -p $HOME/.ipython/profile_default/startup
ln -si $HOME/.ipython/ipython_config.py $HOME/.ipython/profile_default/ipython_config.py
ln -si $HOME/.ipython/startup/utils.py $HOME/.ipython/profile_default/startup/utils.py

setup_gitconfig () {
    echo 'Setting up git config files now.'
    echo 'What is your github author name?'
    read -e git_author_name
    echo 'What is your github author email?'
    read -e git_author_email
    sed -e "s/AUTHORNAME/$git_author_name/g" -e "s/AUTHOREMAIL/$git_author_email/g" $HOME/.dotfiles/git/gitconfig.local.symlink.example > $HOME/.dotfiles/git/gitconfig.local.symlink
    ln -si $HOME/.dotfiles/git/gitconfig.symlink $HOME/.gitconfig
    ln -si $HOME/.dotfiles/git/gitconfig.local.symlink $HOME/.gitconfig.local
    ln -si $HOME/.dotfiles/git/gitmessage.symlink $HOME/.gitmessage
    echo 'Finished git config setup.'
}

setup_gitconfig
