#!/bin/bash
[ -d $HOME/.dotfiles ] || git clone https://github.com/molobrakos/dotfiles $HOME/.dotfiles
. $HOME/.dotfiles/install.sh
