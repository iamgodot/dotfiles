# Shell
export VISUAL="nvim"
export EDITOR="$VISUAL"

# Setup emacs keybindings
bindkey -e

# Load completion module
autoload -U compinit && compinit

OS=$(uname -s)
if [[ "$OS" == "Darwin" ]]; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

setopt histignorealldups

fpath=($HOME/.dotfiles/zsh/functions $fpath)
autoload -U $HOME/.dotfiles/zsh/functions/*(:t)
