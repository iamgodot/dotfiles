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

fpath=($HOME/.dotfiles/zsh/functions $fpath)
autoload -U $HOME/.dotfiles/zsh/functions/*(:t)

# Pew
source $(pew shell_config)

# Pip
export PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
