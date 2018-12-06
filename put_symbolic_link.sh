#!/bin/bash

DOTFILES=(zshrc zshenv zpreztorc tmux.conf vimrc latexmkrc alacritty.yml)  
DOTFILES_DIR=$(pwd)

for file in ${DOTFILES[@]}
do
	dot_file=.${file}
	ln -sfv ${DOTFILES_DIR}/${file} ${HOME}/${dot_file}
	
done 

