#!/bin/bash
CONFIG_DIR=${CONFIG_DIR:-$HOME/dotfiles}
if [ ! -d $CONFIG_DIR ]; then
    echo CONFIG_DIR $CONFIG_DIR is not a valid directory.
    exit 1
fi

[ -f $HOME/.bashrc ] || ln -s $CONFIG_DIR/bashrc_ubuntu $HOME/.bashrc
[ -f $HOME/.bash_profile ] || ln -s $CONFIG_DIR/bash_profile_ubuntu $HOME/.bash_profile
[ -f $HOME/.bash_prompt ] || ln -s $CONFIG_DIR/bash_prompt $HOME/.bash_prompt
[ -f $HOME/.ackrc ] || ln -s $CONFIG_DIR/ackrc $HOME/.ackrc
[ -f $HOME/.ctags ] || ln -s $CONFIG_DIR/ctags $HOME/.ctags
[ -d $HOME/.vim ] || ln -s $CONFIG_DIR/vim $HOME/.vim
[ -f $HOME/.vimrc ] || ln -s $HOME/.vim/vimrc $HOME/.vimrc
[ -f $HOME/.gitconfig ] || ln -s $CONFIG_DIR/gitconfig $HOME/.gitconfig
[ -f $HOME/.gitignore_global ] || ln -s $CONFIG_DIR/gitignore $HOME/.gitignore_global
