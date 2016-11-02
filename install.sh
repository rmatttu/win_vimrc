#!/bin/bash


# setting my vim
cp .vimrc ~/


# install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein.vim/


# clean
rm -f installer.sh


