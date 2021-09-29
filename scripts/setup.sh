#!/usr/bin/bash

# Setup zsh
if [ -f $HOME/.zshrc ]
then
    mv $HOME/.zshrc /tmp/.zshrc.bk
    echo "Backed up old zshrc to /tmp/.zshrc.bk"
fi

# Setup tmux
if [ -f $HOME/.tmux.conf ]
then
    mv $HOME/.tmux.conf /tmp/.tmux.conf.bk
    echo "Backed up old tmux conf to /tmp/.tmux.conf.bk"
fi

# Setup neovim
mkdir -p $HOME/.config/nvim
if [ -f $HOME/.config/nvim/init.vim ]
then
    mv $HOME/.config/nvim/init.vim /tmp/init.vim.bk
    echo "Backed up old init.vim to /tmp/init.vim.bk"
fi

ln -s $HOME/.dotfiles/zsh/zshrc.symlink $HOME/.zshrc
ln -s $HOME/.dotfiles/tmux/tmux.conf.symlink $HOME/.tmux.conf
ln -s $HOME/.dotfiles/nvim/init.vim.symlink $HOME/.config/nvim/init.vim

setup_gitconfig () {
    if [ -f $HOME/.gitconfig ]
    then
        mv $HOME/.gitconfig /tmp/.gitconfig.bk
        echo "Backed up old git config to /tmp/.gitconfig.bk"
    fi
    if [ -f $HOME/.gitconfig.local ]
    then
        mv $HOME/.gitconfig.local /tmp/.gitconfig.local.bk
        echo "Backed up old git local config to /tmp/.gitconfig.local.bk"
    fi
        echo 'What is your github author name?'
        read -e git_author_name
        echo 'What is your github author email?'
        read -e git_author_email

        sed -e "s/AUTHORNAME/$git_author_name/g" -e "s/AUTHOREMAIL/$git_author_email/g" git/gitconfig.local.symlink.example > git/gitconfig.local.symlink
        ln -s $HOME/.dotfiles/git/gitconfig.symlink $HOME/.gitconfig
        ln -s $HOME/.dotfiles/git/gitconfig.local.symlink $HOME/.gitconfig.local
        ln -s $HOME/.dotfiles/git/gitmessage.symlink $HOME/.gitmessage

        echo 'Finished git config setup.'
}

setup_gitconfig
