#!/bin/bash

DOTFILES=(.vimrc .zshrc .zshenv .zprofile)

for file in ${DOTFILES[@]}
do
	ln -s ../$file . 
done

