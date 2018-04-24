#!/bin/bash

DOTFILES=(.vimrc .zshrc .zshenv) 

for file in ${DOTFILES[@]}
do
	cp -f $HOME/$file $HOME/dotfiles/ 
done

cp -rf $HOME/.vim/template $HOME/dotfiles/

