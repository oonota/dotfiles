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

if has('win32unix')
  vnoremap "*y :'<,'>w !cat > /dev/clipboard
endif


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

set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
 
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neocomplcache' 
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'mattn/sonictemplate-vim'
NeoBundle 'cohama/lexima.vim'
NeoBundle 'itchyny/lightline.vim'
au BufNewFile,BufRead *.pde setf processing
 
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
colorscheme hybrid
