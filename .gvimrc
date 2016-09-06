"カラー設定した後にCursorIMを定義する方法
colorscheme desert

if has('multi_byte_ime')
  highlight Cursor guifg=NONE guibg=YellowGreen
  highlight CursorIM guifg=NONE guibg=Purple
endif


SM3
"set guioptions+=r "scroll bar
"set guioptions+=b
set lines=40
set columns=120
set guifont=Consolas:h10:cSHIFTJIS
"set guifont=VL_Gothic:h10:cSHIFTJIS
"set guifont=Myrica_M:h11:cSHIFTJIS
"set guifont=Ricty_Diminished:h11:cSHIFTJIS

" フォントレンダリングを独自に行う
"set renderoptions=type:directx
"set antialias

"set colorcolumn=80
"execute "set colorcolumn=" . join(range(81, 9999), ',')

" noremap <C-V> <C-V>

" 外部でファイルが更新された時のポップアップ警告をしない
set autoread

