#!/bin/bash

for name in .xinitrc .Xmodmap
    do ln -s $HOME/.dotfiles/arch/x/$name $HOME/$name
done

for name in i3 polybar picom
    do ln -s $HOME/.dotfiles/arch/$name $HOME/.config/$name
done

ln -s $HOME/.dotfiles/docker $HOME/.docker
