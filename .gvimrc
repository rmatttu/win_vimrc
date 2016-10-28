"カラー設定した後にCursorIMを定義する方法

" Windows 32bit, Windows 64bit のどちらか
if has('win32') || has ('win64')
    " Ctrl+Vの挙動を変更
    "imap <C-v> <S-Insert>
    set runtimepath+=~/.vim/
    "colorscheme desert
    "colorscheme japanesque
    colorscheme badwolf
endif


if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=YellowGreen
  highlight CursorIM guifg=NONE guibg=Purple
endif


SM3
"set guioptions+=r "scroll bar
"set guioptions+=b
set lines=40
set columns=120
"set guifont=Consolas:h10:cSHIFTJIS
"set guifont=VL_Gothic:h10:cSHIFTJIS
"set guifont=Migu_1M:h10:cSHIFTJIS
"set guifont=Myrica_M:h10:cSHIFTJIS
"set guifont=Ricty_Diminished:h10:cSHIFTJIS
set guifont=Ricty_Diminished_for_Powerline:h10:cSHIFTJIS:qDRAFT

" フォントレンダリングを独自に行う
"set renderoptions=type:directx
"set antialias

"set colorcolumn=80
"execute "set colorcolumn=" . join(range(81, 9999), ',')

" noremap <C-V> <C-V>


