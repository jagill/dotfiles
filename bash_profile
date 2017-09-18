if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
export PATH="$HOME/.cargo/bin:$PATH"
