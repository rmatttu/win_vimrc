rem @echo off
rem dein.vim�𓱓����A�A�h�I���𐮔����܂�
rem
rem


rem �ȉ��X�N���v�g�{��-----------------------------------------------
rem ���̃o�b�`�����݂���t�H���_���J�����g��
pushd %0\..
cls

rem dein.vim�C���X�g�[��
mkdir %USERPROFILE%\.vim\
git clone https://github.com/Shougo/dein.vim.git %USERPROFILE%\.vim\dein.vim\repos\github.com\Shougo\dein.vim\

rem vim�ݒ�t�@�C���R�s�[
copy .vimrc %USERPROFILE%\
copy .gvimrc %USERPROFILE%\

pause


