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
set scrolloff=8
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
set ignorecase
set smartcase
set number
set nowrap
set noshowmode
set autoread
set laststatus=2
syntax on
autocmd QuickFixCmdPost *grep* cwindow

" Unix 用設定
if has('unix')
    "BSで削除できるものを指定する
    set backspace=indent,eol,start
    "テスト中
    set viminfo='100,<50,s10,h,rA:,rB:
endif


" ---------------------------------------------------------------------------
" KeyMap
noremap <ESC><ESC> :noh<ENTER>
nnoremap gw <C-w><C-w>

" ノーマルモードのときにF2で前のバッファ、F3で次のバッファに移動する
map <silent>    <F2>    :bp<cr>
map <silent>    <F3>    :bn<cr>

inoremap jj <Esc>


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.vim/dein.vim')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('fuenor/qfixhowm')
call dein#add('Shougo/neocomplete.vim', { 'rev': '77ec549' })
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('scrooloose/nerdtree')
call dein#add('jistr/vim-nerdtree-tabs')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimfiler')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-fugitive')
call dein#add('itchyny/lightline.vim')
call dein#add('osyo-manga/vim-brightest')
call dein#add('junegunn/vim-easy-align')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('altercation/vim-colors-solarized.git')
call dein#add('airblade/vim-gitgutter')
call dein#add('bronson/vim-trailing-whitespace.git')
call dein#add('tyru/caw.vim.git')
call dein#add('nathanaelkane/vim-indent-guides.git')
call dein#add('Yggdroot/indentLine')
call dein#add('Shougo/vimfiler.vim')
if has('unix')
    call dein#add('joedicastro/vim-molokai256.git')
    call dein#add('brafales/vim-desert256.git')
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})
    call dein#add('Shougo/vimshell.vim')
endif

" colorscheme
call dein#add('sjl/badwolf')
call dein#add('aereal/vim-colors-japanesque.git')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------

" Unix 用カラースキーム
if has('unix')
    " teraterm用設定
    "set term=builtin_linux
    "set ttytype=builtin_linux
    "set t_Co=256
    colorscheme desert256
    "colorscheme molokai256
endif



" ---------------------------------------------------------------------------
" QFixHowm
"QFixHowmキーマップ
"let QFixHowm_Key = 'g'
"howm_dirはファイルを保存したいディレクトリを設定。
let howm_dir             = '$HOME/.vim/howm'
"let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.howm'
"let howm_fileencoding    = 'utf-8'
"let howm_fileformat      = 'unix'
"let QFixHowm_DiaryFile = 'diary/%Y/%m/%Y-%m-%d-000000.howm'
" QFixList表示でファイルへ移動したらウィンドウを閉じる
let QFixHowm_ListCloseOnJump = 1
let QFixHowm_Folding = 0

" ---------------------------------------------------------------------------
" neocomplete.vim
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


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
:command Tf NERDTreeFind
:command Tg VimFiler

noremap tr :NERDTreeTabsToggle<CR>
"noremap tr :VimFilerExplorer<CR>
noremap tf :NERDTreeFind<CR>
noremap tv :VimFiler<CR>



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
let g:multi_cursor_use_default_mapping=1

" Default mapping
"lei<Plug>(neocomplete_start_auto_complete)aaaa<Plug>(neocomplete_start_auto_complete)at g:multi_cursor_next_key='<C-n>'
"lei<Plug>(neocomplete_start_auto_complete)aaaa<Plug>(neocomplete_start_auto_complete)at g:multi_cursor_prev_key='<C-p>'
"lei<Plug>(neocomplete_start_auto_complete)aaaa<Plug>(neocomplete_start_auto_complete)at g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'
"
"" Map start key separately from next key
"let g:multi_cursor_start_key='<F6>'
"
"let g:multi_cursor_start_key='<C-n>'
"let g:multi_cursor_start_word_key='g<C-n>'



" ---------------------------------------------------------------------------
" lightline.vim
"
let g:lightline = {
            \ 'colorscheme': 'powerline',
            \ 'mode_map': { 'c': 'NORMAL' },
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
            \ },
            \ 'component_function': {
            \   'modified': 'LightLineModified',
            \   'readonly': 'LightLineReadonly',
            \   'fugitive': 'LightLineFugitive',
            \   'filename': 'LightLineFilename',
            \   'fileformat': 'LightLineFileformat',
            \   'filetype': 'LightLineFiletype',
            \   'fileencoding': 'LightLineFileencoding',
            \   'mode': 'LightLineMode',
            \ },
            \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
            \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
            \ }
" non powerline
" \ 'separator': { 'left': '', 'right': '' },
" \ 'subseparator': { 'left': '|', 'right': '|' }


function! LightLineModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
    " non powerline
    " return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
    " non powerline
    " return branch
  endif
  return ''
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" power line font sample
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''


" ---------------------------------------------------------------------------
" caw
" コメントの追加・削除を行なう
nmap <Leader>/ <Plug>(caw:zeropos:toggle)
vmap <Leader>/ <Plug>(caw:zeropos:toggle)
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)


" ---------------------------------------------------------------------------
" vim-indent-guides
" gvimでのみindent-guideをオンにする
if has('gui_running')
    let g:indentLine_enabled = 0

    " vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
    let g:indent_guides_enable_on_vim_startup=1
    " ガイドをスタートするインデントの量
    let g:indent_guides_start_level=2
    " 自動カラーを無効にする
    "let g:indent_guides_auto_colors=0
    " 奇数インデントのカラー
    "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#161616 ctermbg=gray
    " 偶数インデントのカラー
    "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#4f4f4f ctermbg=darkgray
    " ハイライト色の変化の幅
    let g:indent_guides_color_change_percent = 5
    " ガイドの幅
    let g:indent_guides_guide_size = 1
else
    let g:indent_guides_enable_on_vim_startup=0

    let g:indentLine_enabled = 1
    "let g:indentLine_setColors = 0
    let g:indentLine_color_term = 239
    let g:indentLine_char = '|'
    "let g:indentLine_concealcursor = '.'
    "let g:indentLine_conceallevel = 2
    "let g:indentLine_setConceal = 0
end



