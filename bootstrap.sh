#!/bin/bash

# cd /tmp && wget https://raw.githubusercontent.com/molobrakos/dotfiles/master/bootstrap.sh && source bootstrap.sh

[ -d $HOME/.dotfiles ] || git clone https://github.com/molobrakos/dotfiles $HOME/.dotfiles
. $HOME/.dotfiles/install.sh
