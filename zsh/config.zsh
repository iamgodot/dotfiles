# Oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  z
  git
  encode64
  zsh-autosuggestions
)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

source $ZSH/oh-my-zsh.sh

# Shell
export VISUAL="nvim"
export EDITOR="$VISUAL"

setopt histignorealldups

# FIXME: autoload not working currently
fpath=($HOME/.dotfiles/functions $fpath)
autoload -U $HOME/.dotfiles/functions/*(:t)

f() {
  local files
  IFS=$'\n' files=($(fzf --height 40% --query="$1" --multi --preview 'cat {}'))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

# Pew
source $(pew shell_config)
