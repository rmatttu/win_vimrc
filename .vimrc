" ---------------------------------------------------------------------------
" Setting
" vimでヤンク(コピー)するとwindowsのクリップボードにも格納
set clipboard=unnamed

" .swapファイルを作らない
set noswapfile
" バックアップファイルを作らない
set nowritebackup
" バックアップをしない
set nobackup
" undo ファイルを作成しない
set noundofile

" スクロール時に表示をn行確保
" 縦方向
set scrolloff=5
" 横方向
set sidescrolloff=5

" 画面の左右の端でスクロールが発生した場合、何文字ずつスクロールするか
set sidescroll=5

" textwidthが上書かれてしまうらしい
autocmd FileType text setlocal textwidth=0

" Linux開発用
set encoding=utf-8
set ff=unix

" インデントをTabではなくスペース4つで揃える
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" 検索オプション
set noignorecase
set smartcase

" Ctrl+Vの挙動を変更
imap <C-v> <S-Insert>


set number

set nowrap
set showtabline=1

set laststatus=2
set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 


" ---------------------------------------------------------------------------
" KeyMap
"Ctrl + ]で行の途中からでも改行が出来ます。
inoremap <C-]> <ESC>$a<ENTER>
nnoremap <C-]> $a<ENTER>

noremap <ESC><ESC> :noh<ENTER>

" ノーマルモードのときにF2で前のバッファ、F3で次のバッファに移動する
map <silent>    <F2>    :bp<cr>
map <silent>    <F3>    :bn<cr>


" ---------------------------------------------------------------------------
" NeoBundle
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'nathanaelkane/vim-indent-guides.git'
"NeoBundle 'qfixapp'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
"IMの制御がおかしくなる不具合
"NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'osyo-manga/vim-brightest'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bronson/vim-trailing-whitespace.git'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'rhysd/accelerated-jk.git'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck



"" ---------------------------------------------------------------------------
"" vim-indent-guides
""let g:indent_guides_auto_colors = 0
""autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
""autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
""set ts=4 sw=4 et
""let g:indent_guides_start_level = 2
""let g:indent_guides_guide_size = 1
"
"set ts=4 sw=4
"" ***
"let g:neocomplcache_enable_at_startup = 1
"
"" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
"let g:indent_guides_enable_on_vim_startup=1
"" ガイドをスタートするインデントの量
"let g:indent_guides_start_level=2
"" 自動カラーを無効にする
""let g:indent_guides_auto_colors=0
"" 奇数インデントのカラー
""autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#161616 ctermbg=gray
"" 偶数インデントのカラー
""autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#4f4f4f ctermbg=darkgray
"" ハイライト色の変化の幅
"let g:indent_guides_color_change_percent = 5
"" ガイドの幅
"let g:indent_guides_guide_size = 1


"" ---------------------------------------------------------------------------
"" QFixHowm
""QFixHowmキーマップ
""let QFixHowm_Key = 'g'
"
""howm_dirはファイルを保存したいディレクトリを設定。
"let howm_dir             = '$VIM/howm'
""let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.howm'
""let howm_fileencoding    = 'utf-8'
""let howm_fileformat      = 'unix'
"
""let QFixHowm_DiaryFile = 'diary/%Y/%m/%Y-%m-%d-000000.howm'
"
"" QFixList表示でファイルへ移動したらウィンドウを閉じる
"let QFixHowm_ListCloseOnJump = 1


" ---------------------------------------------------------------------------
" neocomplcache
"
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" ---------------------------------------------------------------------------
" NeoSnippet
" Plugin key-mappings.
"
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif



" ---------------------------------------------------------------------------
"  unite.vim
"
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-B> :Unite buffer<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" 初期設定関数を起動する
au FileType unite call s:unite_my_settings()
    function! s:unite_my_settings()
    " Overwrite settings.
endfunction

" 様々なショートカット
call unite#custom#substitute('file', '\$\w\+', '\=eval(submatch(0))', 200)
call unite#custom#substitute('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
call unite#custom#substitute('file', '^@', '\=getcwd()."/*"', 1)
call unite#custom#substitute('file', '^;r', '\=$VIMRUNTIME."/"')
call unite#custom#substitute('file', '^\~', escape($HOME, '\'), -2)
call unite#custom#substitute('file', '\\\@<! ', '\\ ', -20)
call unite#custom#substitute('file', '\\ \@!', '/', -30)

if has('win32') || has('win64')
    call unite#custom#substitute('file', '^;p', 'C:/Program Files/')
    call unite#custom#substitute('file', '^;v', '~/vimfiles/')
else
    call unite#custom#substitute('file', '^;v', '~/.vim/')
endif



" ---------------------------------------------------------------------------
"  NERDTree
"
let g:NERDTreeShowBookmarks=1

"ファイル名が指定されてVIMが起動した場合はNERDTreeを表示しない
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

"let g:NERDTreeDirArrows = 1
"let g:NERDTreeDirArrowExpandable  = '→'
"let g:NERDTreeDirArrowCollapsible = '▼'

" 不可視ファイルを表示する
let NERDTreeShowHidden = 1



" ---------------------------------------------------------------------------
" vim-nerdtree-tabs
"
let g:nerdtree_tabs_open_on_gui_startup = 0
:command Tr NERDTreeTabsToggle



" ---------------------------------------------------------------------------
" CtrlP
"
"noremap <C-N> :CtrlP<CR>



" ---------------------------------------------------------------------------
" vim-easy-align
"
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)



" ---------------------------------------------------------------------------
" vim-multiple-cursors
"
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Map start key separately from next key
let g:multi_cursor_start_key='<F6>'

let g:multi_cursor_start_key='<C-n>'
let g:multi_cursor_start_word_key='g<C-n>'



" ---------------------------------------------------------------------------
" vim-airline
"
" Powerline系フォントを利用する
let g:airline_powerline_fonts = 1

" タブバーのカスタマイズを有効にする
let g:airline#extensions#tabline#enabled = 1

" タブバーの右領域を非表示にする
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0




" ---------------------------------------------------------------------------
" caw
" コメントの追加・削除を行なう
nmap <Leader>/ <Plug>(caw:zeropos:toggle)
vmap <Leader>/ <Plug>(caw:zeropos:toggle)



" ---------------------------------------------------------------------------
" accelerated-jk
"
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)



