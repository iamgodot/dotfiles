#!/bin/bash

# Ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Nerd fonts
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git $HOME/nerd-fonts
$HOME/nerd-fonts/install.sh

# Fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
