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
    source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt share_history
setopt histignorealldups

fpath=($HOME/.dotfiles/zsh/functions $fpath)
autoload -U $HOME/.dotfiles/zsh/functions/*(:t)
