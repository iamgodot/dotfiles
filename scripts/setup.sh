#!/bin/bash

setup_dotfiles () {
    #echo 'Existing config files will be backed up using `ln -b`.'
    ln -si $HOME/.dotfiles/zsh/zshrc.symlink $HOME/.zshrc
    ln -si $HOME/.dotfiles/tmux/tmux.conf.symlink $HOME/.tmux.conf
    ln -si $HOME/.dotfiles/nvim $HOME/.config/nvim
    ln -si $HOME/.dotfiles/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
    mkdir -p $HOME/.ipython/profile_default/startup
    ln -si $HOME/.ipython/ipython_config.py $HOME/.ipython/profile_default/ipython_config.py
    ln -si $HOME/.ipython/startup/utils.py $HOME/.ipython/profile_default/startup/utils.py
    ln -si $HOME/.dotfiles/zsh/p10k.symlink $HOME/.p10k.zsh
}

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

setup_zsh () {
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
}

setup_dotfiles
setup_gitconfig
setup_zsh
