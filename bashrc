# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# If not running interactively, don't do anything
if [[ -n "$PS1" ]] ; then

    # don't put duplicate lines in the history. See bash(1) for more options
    # ... or force ignoredups and ignorespace
    HISTCONTROL=ignoredups:ignorespace

    # append to the history file, don't overwrite it
    shopt -s histappend

    # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
    HISTSIZE=1000
    HISTFILESIZE=2000

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

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

    if [ -f $HOME/.projectsrc ]; then
        source $HOME/.projectsrc 
    fi

    #Syntax highlighting for less -- Removed
    #export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
    export LESS=' -R '

fi #endif for $PS1
