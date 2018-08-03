"
" Vundle practice
"
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

"vim-nerdtree-tabs
let g:nerdtree_tabs_open_on_console_startup=1

"sonictemplate-vim
"set template directory
let g:sonictemplate_vim_template_dir = [
      \ '~/.vim/template'
      \]
"lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }


"複数行コメントアウト  ctrl-kで実行
nmap <C-K> <Plug>(caw:hatpos:toggle)
vmap <C-K> <Plug>(caw:hatpos:toggle)


"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
	endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

"-------------------------------------------------------------
"" neocomplchache
"Start
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }


" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"End
"-------------------------------------------------------------

"-------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Shougo/neocomplcache'    "補完
Plugin 'scrooloose/nerdtree'     "プロジェクトツリー
Plugin 'jistr/vim-nerdtree-tabs' "プロジェクトツリー
Plugin 'w0ng/vim-hybrid'
Plugin 'Yggdroot/indentLine'     "インデント可視化
Plugin 'mattn/sonictemplate-vim' "補完
Plugin 'cohama/lexima.vim'       "自動で括弧閉じる
Plugin 'itchyny/lightline.vim'
Plugin 'tyru/caw.vim.git'        "複数行コメントアウト

call vundle#end()
filetype plugin indent on
"-------------------------------------------------------------



"色
colorscheme hybrid
