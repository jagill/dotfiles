#!/bin/bash
set -euo pipefail

if [[ -z "${1:-}" ]]; then
  echo "Please supply the architecture (macos, ubuntu, rh) as the first argument." >&2
  exit 1
fi

arch=$1

if [ ! "$arch" == "macos" -a ! "$arch" == "ubuntu" -a ! "$arch" == "rh" ]; then
  echo "The architecture must be one of macos, ubuntu, rh." >&2
  exit 1
fi

# Set xdg directories
CONFIG_HOME=$HOME/.config
mkdir -p $CONFIG_HOME

CONFIG_DIR=${CONFIG_DIR:-$HOME/dotfiles}
if [ ! -d $CONFIG_DIR ]; then
  echo CONFIG_DIR $CONFIG_DIR is not a valid directory.
  exit 1
fi

[ -f $HOME/.zshrc ] || ln -s $CONFIG_DIR/zshrc_${arch} $HOME/.zshrc
[ -f $HOME/.bashrc ] || ln -s $CONFIG_DIR/bashrc_${arch} $HOME/.bashrc
[ -f $HOME/.gitignore_global ] || ln -s $CONFIG_DIR/gitignore $HOME/.gitignore_global

for f in bash_profile inputrc vimrc ackrc hgrc ctags gitconfig jshintrc tmux.conf; do
  [ -f $HOME/.$f ] || ln -s $CONFIG_DIR/$f $HOME/.$f
done

mkdir -p $CONFIG_HOME/nvim
[ -f $CONFIG_HOME/nvim/init.vim ] || ln -s $CONFIG_DIR/init.vim $CONFIG_HOME/nvim/init.vim

if [ ! -d $HOME/.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
  vim +PluginInstall +qall
fi
