#!/bin/bash
CONFIG_DIR=${CONFIG_DIR:-$HOME/Dropbox/config}
if [ ! -d $CONFIG_DIR ]; then
    echo CONFIG_DIR $CONFIG_DIR is not a valid directory.
    exit 1
fi

[ -f $HOME/.bashrc ] || ln -s $CONFIG_DIR/bashrc_macos $HOME/.bashrc
[ -f $HOME/.bash_profile ] || ln -s $CONFIG_DIR/bash_profile_mac $HOME/.bash_profile
[ -f $HOME/.bash_aliases ] || ln -s $CONFIG_DIR/bash_aliases_mac $HOME/.bash_aliases
[ -f $HOME/.bash_prompt ] || ln -s $CONFIG_DIR/bash_prompt $HOME/.bash_prompt
[ -d $HOME/.vim ] || ln -s $CONFIG_DIR/vim $HOME/.vim
[ -f $HOME/.vimrc ] || ln -s $HOME/.vim/vimrc $HOME/.vimrc
[ -f $HOME/.gitignore_global ] || ln -s $CONFIG_DIR/gitignore $HOME/.gitignore_global

for f in ackrc ctags psqlrc gitconfig jshintrc; do
  [ -f $HOME/.$f ] || ln -s $CONFIG_DIR/$f $HOME/.$f
done

