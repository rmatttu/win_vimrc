"カラー設定した後にCursorIMを定義する方法
"colorscheme desert
colorscheme japanesque

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
set guifont=VL_Gothic:h10:cSHIFTJIS
"set guifont=Migu_1M:h10:cSHIFTJIS
"set guifont=Myrica_M:h10:cSHIFTJIS
"set guifont=Ricty_Diminished:h10:cSHIFTJIS

" フォントレンダリングを独自に行う
"set renderoptions=type:directx
"set antialias

"set colorcolumn=80
"execute "set colorcolumn=" . join(range(81, 9999), ',')

" noremap <C-V> <C-V>


