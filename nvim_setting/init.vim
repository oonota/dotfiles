" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

" ENV
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

" Load rc file
function! s:load(file) abort
    let s:path = expand('$CONFIG/nvim/rc/' . a:file . '.vim')

    if filereadable(s:path)
        execute 'source' fnameescape(s:path)
    endif
endfunction

call s:load('plugins')


let s:dein_path = expand('~/.vim/dein')

if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  call dein#add('Shougo/dein.vim')

	call dein#add('Shougo/deoplete.nvim') 
	call dein#add('scrooloose/nerdtree')     "プロジェクトツリー
	call dein#add('jistr/vim-nerdtree-tabs') "プロジェクトツリー
	call dein#add('Yggdroot/indentLine')     "インデント可視化
	call dein#add('cohama/lexima.vim')       "自動で括弧閉じる
	call dein#add('tyru/caw.vim.git')        "複数行コメントアウト
	call dein#add('vim-scripts/Markdown')    "markdown syntax
	call dein#add('zchee/deoplete-jedi')    "python補完
	call dein#add('w0ng/vim-hybrid')    "colorscheme

	





  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

"---------------------------------------------------------------------------------------
"standart setting
set number
set title
syntax enable
set background=dark
let g:hybrid_use_iTerm_colors = 1
set t_Co=256
syntax on
set cursorline
"set mouse=a
set scrolloff=8
set backspace=indent,eol,start
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp
set tabstop=2
set shiftwidth=2

"for clipboard
set clipboard+=unnamed

"colorshceme
"colorscheme iceberg 
"---------------------------------------------------------------------------------------



"---------------------------------------------------------------------------------------
"Plugin setting

"deoplete
let g:deoplete#enable_at_startup = 1

"vim-nerdtree-tabs
let g:nerdtree_tabs_open_on_console_startup=1

"複数行コメントアウト  ctrl-kで実行
nmap <C-K> <Plug>(caw:hatpos:toggle)
vmap <C-K> <Plug>(caw:hatpos:toggle)

"---------------------------------------------------------------------------------------
