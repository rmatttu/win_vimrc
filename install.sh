#!/bin/bash

# install neobundle
cd ~
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh

# setting my vim
cp ~/vimrc_linux/.vimrc ~/
cd ~/.vim/bundle/neobundle.vim/

# neoinstall
bin/neoinstall

# カラースキームのインストール
git clone https://github.com/joedicastro/vim-molokai256.git
mkdir ~/.vim/colors/
cp vim-molokai256/colors/molokai256.vim ~/.vim/colors/

# clean
rm -f install.sh

