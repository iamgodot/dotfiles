#!/usr/bin/bash

echo 'Existing config files will be backed up using `ln -b`.'

echo 'Setting up config files for zsh & tmux & neovim now.'
ln -s $HOME/.dotfiles/zsh/zshrc.symlink $HOME/.zshrc -b
ln -s $HOME/.dotfiles/tmux/tmux.conf.symlink $HOME/.tmux.conf -b
ln -s $HOME/.dotfiles/nvim/init.vim.symlink $HOME/.config/nvim/init.vim -b
echo 'Finished setup for the suite.'

setup_gitconfig () {
    echo 'Setting up git config files now.'
    echo 'What is your github author name?'
    read -e git_author_name
    echo 'What is your github author email?'
    read -e git_author_email
    sed -e "s/AUTHORNAME/$git_author_name/g" -e "s/AUTHOREMAIL/$git_author_email/g" $HOME/.dotfiles/git/gitconfig.local.symlink.example > $HOME/.dotfiles/git/gitconfig.local.symlink
    ln -s $HOME/.dotfiles/git/gitconfig.symlink $HOME/.gitconfig -b
    ln -s $HOME/.dotfiles/git/gitconfig.local.symlink $HOME/.gitconfig.local -b
    ln -s $HOME/.dotfiles/git/gitmessage.symlink $HOME/.gitmessage -b
    echo 'Finished git config setup.'
}

setup_gitconfig
