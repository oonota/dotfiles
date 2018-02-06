#!/bin/bash

DOTFILES=(.vimrc .zshrc .zshenv .zprofile)

for file in ${DOTFILES[@]}
do
	cp -f $HOME/$file $HOME/dotfiles/ 
done

