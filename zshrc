autoload -Uz compinit && compinit
autoload -U colors && colors

ZPROMPT="$HOME/dotfiles/zsh_prompt"
[ -f "$ZPROMPT" ] && source "$ZPROMPT"
