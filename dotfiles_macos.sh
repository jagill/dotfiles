#!/bin/bash
CONFIG_DIR=${CONFIG_DIR:-$HOME/dotfiles}
if [ ! -d $CONFIG_DIR ]; then
    echo CONFIG_DIR $CONFIG_DIR is not a valid directory.
    exit 1
fi

[ -f $HOME/.bashrc ] || ln -s $CONFIG_DIR/bashrc_macos $HOME/.bashrc
[ -f $HOME/.bash_profile ] || ln -s $CONFIG_DIR/bash_profile_mac $HOME/.bash_profile
[ -f $HOME/.gitignore_global ] || ln -s $CONFIG_DIR/gitignore $HOME/.gitignore_global

for f in vimrc ackrc ctags gitconfig jshintrc; do
  [ -f $HOME/.$f ] || ln -s $CONFIG_DIR/$f $HOME/.$f
done

if [ ! -d $HOME/.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
  vim +PluginInstall +qall
fi
