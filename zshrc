autoload -Uz compinit && compinit
autoload -U colors && colors
#
## never ever beep ever
setopt NO_BEEP

ZPROMPT="$HOME/dotfiles/zsh_prompt"
[ -f "$ZPROMPT" ] && source "$ZPROMPT"

PRESTORC="$HOME/dotfiles/prestorc"
[ -f "$PRESTORC" ] && source "$PRESTORC"

PROJECTSRC="$HOME/dotfiles/projectsrc"
[ -f "$PROJECTSRC" ] && source "$PROJECTSRC"


export PATH="$HOME/.cargo/bin:$PATH"
