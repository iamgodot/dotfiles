# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:/home/$USER/.local/bin:$PATH
export PATH=$HOME/bin:/home/$USER/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/$USER/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  z
  git
  encode64
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias python="/usr/bin/python3"
# setxkbmap -option ctrl:swapcaps
# setxkbmap -option altwin:swap_lalt_lwin

export VISUAL="nvim"
export EDITOR="$VISUAL"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "`pip completion --zsh`"

# git log format
#alias gl="git log --graph --all --pretty=format:'%C(yellow)%h -%C(auto)%d %C(bold cyan)%s %C(bold white)(%cr)%Creset %C(dim white)<%an>'"
#alias gf="git fetch"
#alias gp="git pull"
#alias gpu="git pull upstream master"
#alias gr="git remote -v"
#alias gs="git status"
#alias gcm="git commit -m"
#alias ga="git add"
#alias gb="git branch -va"
#alias gbd="git branch -d"
#alias gc="git checkout"
#alias gcb="git checkout -b"
#alias gd="git diff"
#alias gm="git merge"

# fzf
# # fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .pyc'
f() {
  local files
  IFS=$'\n' files=($(fzf --height 40% --query="$1" --multi --preview 'cat {}'))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

# zsh auto suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

function sson() {
	export http_proxy=http://127.0.0.1:2222
	export https_proxy=http://127.0.0.1:2222
	#export all_proxy=http://localhost:9012
}
function ssoff() {
	unset http_proxy https_proxy
}

alias ipinfo="curl ipinfo.io"
alias ipv4="curl ipv4.ip.sb"
alias ipv6="curl ipv6.ip.sb"
alias speed="speedtest-cli --simple"

# clipmenu
export CM_LAUNCHER=rofi
alias clip='/usr/bin/clipmenu -theme solarized-darker -font "Noto Sans Mono 12"'

# options
setopt histignorealldups

# pew
source $(pew shell_config)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
