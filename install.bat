rem @echo off
rem dein.vimを導入し、アドオンを整備します
rem
rem


rem 以下スクリプト本文-----------------------------------------------
rem このバッチが存在するフォルダをカレントに
pushd %0\..
cls

rem dein.vimインストール
mkdir %USERPROFILE%\.vim\bundle
git clone https://github.com/Shougo/dein.vim.git %USERPROFILE%\.vim\dein.vim\repos\github.com\Shougo\dein.vim\

rem vim設定ファイルコピー
copy .vimrc %USERPROFILE%\
copy .gvimrc %USERPROFILE%\

rem カラースキームのインストール
mkdir %USERPROFILE%\.vim\colors\

git clone https://github.com/joedicastro/vim-molokai256.git
copy vim-molokai256\colors\molokai256.vim %USERPROFILE%\.vim\colors\

git clone https://github.com/brafales/vim-desert256.git
copy vim-desert256\colors\desert256.vim %USERPROFILE%\.vim\colors\

git clone https://github.com/aereal/vim-colors-japanesque.git
copy vim-colors-japanesque\colors\japanesque.vim %USERPROFILE%\.vim\colors\


pause



