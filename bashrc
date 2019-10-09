# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

if [ -d "$HOME/.bashrc.local" ]; then
  for f in "$HOME/.bashrc.local/*"; do
    source $f
  done
fi

# If not running interactively, don't do anything
if [[ -n "$PS1" ]] ; then

    # don't put duplicate lines in the history. See bash(1) for more options
    # ... or force ignoredups and ignorespace
    HISTCONTROL=ignoredups:ignorespace

    # append to the history file, don't overwrite it
    shopt -s histappend

    # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
    HISTSIZE=10000
    HISTFILESIZE=-1

    # Use standard ISO 8601 timestamp
    # %F equivalent to %Y-%m-%d
    # %T equivalent to %H:%M:%S (24-hours format)
    HISTTIMEFORMAT='%F %T '

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # Turn on recursive globbing (enables ** to recurse all directories)
    shopt -s globstar 2> /dev/null

    # Case-insensitive globbing (used in pathname expansion)
    # shopt -s nocaseglob;

    # Display matches for ambiguous patterns at first tab press
    bind "set show-all-if-ambiguous on"

    # This allows you to bookmark your favorite places across the file system
    # Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
    # shopt -s cdable_vars

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    if [ -f $CONFIG/bash_aliases ]; then
        source $CONFIG/bash_aliases
    fi

    # Fancy prompt
    if [ -f $CONFIG/bash_prompt ]; then
        source $CONFIG/bash_prompt
    fi

    if [ -f $BASH_COMPLETION_DIR/git-completion.bash ]; then
        source $BASH_COMPLETION_DIR/git-completion.bash
    fi

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    #if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    #    . /etc/bash_completion
    #fi

    ## User specific additions

    if [ -d $CONFIG/bin ]; then
        PATH=$PATH:$CONFIG/bin
    fi

    export EDITOR=vim
    export VIMDIR=$HOME/.vim


    export WORKON_HOME=~/.envs
    # This takes 200ms; is there a way to speed it up?
    VIRTUALENV_WRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
    if [ -f $VIRTUALENV_WRAPPER_SCRIPT ]; then
      source $VIRTUALENV_WRAPPER_SCRIPT
    fi

    #Syntax highlighting for less -- Removed
    #export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
    export LESS=' -R '

fi #endif for $PS1
