#!/bin/bash


# setting my vim
cp .vimrc ~/


# install dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/dein.vim/


# カラースキームのインストール
mkdir ~/.vim/colors/

git clone https://github.com/joedicastro/vim-molokai256.git
cp vim-molokai256/colors/molokai256.vim ~/.vim/colors/

git clone https://github.com/brafales/vim-desert256.git
cp vim-desert256/colors/desert256.vim ~/.vim/colors/

git clone https://github.com/aereal/vim-colors-japanesque.git
cp vim-colors-japanesque/colors/japanesque.vim ~/.vim/colors/


# clean
rm -f installer.sh


