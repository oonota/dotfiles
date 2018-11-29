#!/bin/sh

DOTFILES=(zshrc zshenv zpreztorc tmux.conf vimrc latexmkrc)  
DOTFILES_DIR=$(pwd)

for file in ${DOTFILES[@]}
do
	dot_file=.${file}
	echo "ln -sfv ${DOTFILES_DIR}/${file} ${HOME}/${dot_file}"
	
done 

