#!/bin/bash

# dein install
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh

mkdir -pv ${HOME}/.vim
sh ./installer.sh ${HOME}/.vim/dein

rm -f ./install.sh


# ln -sfv ${HOME}/.vim/


