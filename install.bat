rem @echo off
rem vimにNeoBundleを導入し、アドオンを整備します
rem
rem


rem 以下スクリプト本文-----------------------------------------------
rem このバッチが存在するフォルダをカレントに
pushd %0\..
cls

rem NeoBundleインストール
mkdir %USERPROFILE%\.vim\bundle
git clone https://github.com/Shougo/neobundle.vim %USERPROFILE%\.vim\bundle\neobundle.vim

rem vim設定ファイルコピー
copy .vimrc %USERPROFILE%\
copy .gvimrc %USERPROFILE%\

rem カラースキームのインストール
git clone https://github.com/joedicastro/vim-molokai256.git
mkdir %USERPROFILE%\.vim\colors\
copy vim-molokai256\colors\molokai256.vim %USERPROFILE%\.vim\colors\

pause



