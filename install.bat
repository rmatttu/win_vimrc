rem @echo off
rem vim��NeoBundle�𓱓����A�A�h�I���𐮔����܂�
rem
rem


rem �ȉ��X�N���v�g�{��-----------------------------------------------
rem ���̃o�b�`�����݂���t�H���_���J�����g��
pushd %0\..
cls

rem NeoBundle�C���X�g�[��
mkdir %USERPROFILE%\.vim\bundle
git clone https://github.com/Shougo/neobundle.vim %USERPROFILE%\.vim\bundle\neobundle.vim

rem vim�ݒ�t�@�C���R�s�[
copy .vimrc %USERPROFILE%\
copy .gvimrc %USERPROFILE%\

rem �J���[�X�L�[���̃C���X�g�[��
mkdir %USERPROFILE%\.vim\colors\
git clone https://github.com/joedicastro/vim-molokai256.git
copy vim-molokai256\colors\molokai256.vim %USERPROFILE%\.vim\colors\
git clone https://github.com/aereal/vim-colors-japanesque
copy vim-colors-japanesque\colors\japanesque.vim %USERPROFILE%\.vim\colors\

pause



