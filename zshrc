autoload -Uz compinit && compinit
autoload -U colors && colors
#
## never ever beep ever
setopt NO_BEEP

ZPROMPT="$HOME/dotfiles/zsh_prompt"
[ -f "$ZPROMPT" ] && source "$ZPROMPT"

