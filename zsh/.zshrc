# Start Hyprland
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec Hyprland

# Find all zsh files
typeset -U config_files
config_files=($HOME/.dotfiles/**/*.zsh)

# Load path files
for file in ${(M)config_files:#*/path.zsh}
do
    source $file
done

# Load other config files except completion ones
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
    source $file
done

# Load completion files
for file in ${(M)config_files:#*/completion.zsh}
do
    source $file
done

unset config_files

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/duo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/duo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/duo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/duo/google-cloud-sdk/completion.zsh.inc'; fi
