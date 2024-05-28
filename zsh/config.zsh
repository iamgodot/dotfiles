# Shell
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Setup emacs keybindings
bindkey -e

# Load completion module
autoload -U compinit && compinit

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt histignorealldups

fpath=($HOME/.dotfiles/zsh/functions $fpath)
autoload -U $HOME/.dotfiles/zsh/functions/*(:t)
