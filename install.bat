rem @echo off
rem dein.vim�𓱓����A�A�h�I���𐮔����܂�
rem
rem


rem �ȉ��X�N���v�g�{��-----------------------------------------------
rem ���̃o�b�`�����݂���t�H���_���J�����g��
pushd %0\..
cls

rem dein.vim�C���X�g�[��
mkdir %USERPROFILE%\.vim\bundle
git clone https://github.com/Shougo/dein.vim.git %USERPROFILE%\.vim\dein.vim\repos\github.com\Shougo\dein.vim\

rem vim�ݒ�t�@�C���R�s�[
copy .vimrc %USERPROFILE%\
copy .gvimrc %USERPROFILE%\

rem �J���[�X�L�[���̃C���X�g�[��
mkdir %USERPROFILE%\.vim\colors\

git clone https://github.com/joedicastro/vim-molokai256.git
copy vim-molokai256\colors\molokai256.vim %USERPROFILE%\.vim\colors\

git clone https://github.com/brafales/vim-desert256.git
copy vim-desert256\colors\desert256.vim %USERPROFILE%\.vim\colors\

git clone https://github.com/aereal/vim-colors-japanesque.git
copy vim-colors-japanesque\colors\japanesque.vim %USERPROFILE%\.vim\colors\


pause



