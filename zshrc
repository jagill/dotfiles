autoload -Uz compinit && compinit
autoload -U colors && colors
#
## never ever beep ever
setopt NO_BEEP

# Set xdg directories
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

ZPROMPT="$HOME/dotfiles/zsh_prompt"
[ -f "$ZPROMPT" ] && source "$ZPROMPT"

