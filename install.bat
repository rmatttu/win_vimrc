rem @echo off
rem dein.vimを導入し、アドオンを整備します
rem
rem


rem 以下スクリプト本文-----------------------------------------------
rem このバッチが存在するフォルダをカレントに
pushd %0\..
cls

rem dein.vimインストール
mkdir %USERPROFILE%\.vim\
git clone https://github.com/Shougo/dein.vim.git %USERPROFILE%\.vim\dein.vim\repos\github.com\Shougo\dein.vim\

rem vim設定ファイルコピー
copy .vimrc %USERPROFILE%\
copy .gvimrc %USERPROFILE%\

pause


