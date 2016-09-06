#!/bin/bash
CONFIG_DIR=${CONFIG_DIR:-$HOME/dotfiles}
if [ ! -d $CONFIG_DIR ]; then
    echo CONFIG_DIR $CONFIG_DIR is not a valid directory.
    exit 1
fi

[ -f $HOME/.bashrc ] || ln -s $CONFIG_DIR/bashrc_ubuntu $HOME/.bashrc
[ -f $HOME/.bash_profile ] || ln -s $CONFIG_DIR/bash_profile_ubuntu $HOME/.bash_profile

for f in vimrc ackrc ctags gitconfig jshintrc; do
  [ -f $HOME/.$f ] || ln -s $CONFIG_DIR/$f $HOME/.$f
done

if [ ! -d $HOME/.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
  vim +PluginInstall +qall
fi
