#!/bin/bash

DOTFILES=(.vimrc .zshrc .zshenv)

for file in ${DOTFILES[@]}
do
	cp -f $HOME/dotfiles/$file $HOME/ 
done

cp -rf $HOME/dotfiles/template $HOME/.vim/

