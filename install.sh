grep -q dotfiles $HOME/.bashrc || echo "[ -r $HOME/.dotfiles/bash/bashrc ] && . $HOME/.dotfiles/bash/bashrc" >> $HOME/.bashrc

ln -f -v -s $HOME/.dotfiles/home/gitignore $HOME/.gitignore
ln -f -v -s $HOME/.dotfiles/home/gitconfig $HOME/.gitconfig
ln -f -v -s $HOME/.dotfiles/home/emacs $HOME/.emacs
ln -f -v -s $HOME/.dotfiles/home/ssh/config $HOME/.ssh/config

. $HOME/.bashrc
