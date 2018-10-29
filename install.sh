grep -q dotfiles $HOME/.bashrc || echo "[ -r $HOME/.dotfiles/bash/bashrc ] && . $HOME/.dotfiles/bash/bashrc" >> $HOME/.bashrc

ln -sfv $HOME/.dotfiles/home/gitignore $HOME/.gitignore
ln -sfv $HOME/.dotfiles/home/gitconfig $HOME/.gitconfig
ln -sfv $HOME/.dotfiles/home/emacs $HOME/.emacs
ln -sfv $HOME/.dotfiles/home/ssh/config $HOME/.ssh/config
test -d $HOME/.byobu && mv $HOME/.byobu /tmp ; ln -sfv $HOME/.dotfiles/home/byobu $HOME/.byobu

. $HOME/.bashrc
