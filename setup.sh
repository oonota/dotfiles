#!/bin/bash

DOTFILES=(.vimrc .zshrc .zshenv .zprofile)

for file in ${DOTFILES[@]}
do
	ln -s $HOME/$file $HOME/dotfiles/$file
done

