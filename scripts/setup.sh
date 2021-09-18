#!/usr/bin/bash

# Setup zsh
if [ -f $HOME/.zshrc ]; then
	mv $HOME/.zshrc /tmp/.zshrc.bk
	echo "Backed zshrc to /tmp/.zshrc.bk"
fi

# Setup tmux
if [ -f $HOME/.tmux.conf ]; then
	mv $HOME/.tmux.conf /tmp/.tmux.conf.bk
	echo "Backed tmux conf to /tmp/.tmux.conf.bk"
fi

# Setup neovim
mkdir -p $HOME/.config/nvim
if [ -f $HOME/.config/nvim/init.vim ]; then
	mv $HOME/.config/nvim/init.vim /tmp/init.vim.bk
	echo "Backed init.vim to /tmp/init.vim.bk"
fi

ln -s $HOME/.dotfiles/zsh/zshrc.symlink $HOME/.zshrc
ln -s $HOME/.dotfiles/tmux/tmux.conf.symlink $HOME/.tmux.conf
ln -s $HOME/.dotfiles/nvim/init.vim.symlink $HOME/.config/nvim/init.vim
