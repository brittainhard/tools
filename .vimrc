set textwidth=80
set expandtab
set foldmethod=indent
set autochdir
set noswapfile
set splitbelow
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>
set relativenumber
set tags=tags;/

"Colors
colorscheme kxxe
set background=dark
set t_Co=256

"Deal with mac backspace problem.
set backspace=2
set backspace=indent,eol,start

"Cursors
highlight Folded ctermbg=2
highlight TabLine ctermbg=2

"set cursorline
highlight CursorLine ctermbg=23 cterm=NONE

"Filetypes
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4 
autocmd FileType c setlocal shiftwidth=4 tabstop=4 
autocmd FileType go setlocal shiftwidth=8 tabstop=8 
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType rkt setlocal shiftwidth=4 tabstop=4
autocmd FileType snippets setlocal shiftwidth=4 tabstop=4 

"Configs
let GITROOT = system("git rev-parse --show-toplevel")

"Leaders and vimrc commands
let mapleader=","
nnoremap <Leader>ev :tabedit $MYVIMRC<cr>
nnoremap <Leader>sv :source $MYVIMRC<cr>
nnoremap <Leader>rtcl :term tclsh %<cr>
nnoremap <Leader>rp :term python %<cr>
nnoremap <Leader>rtp :term pytest %<cr>
nnoremap <Leader>rip :vert term ipython -i %<cr>
nnoremap <Leader>rg :term go run %<cr>
nnoremap <Leader>drg :call GoDebug()<cr>
nnoremap <Leader>rjs :term node %<cr>
nnoremap <Leader>rc :call CScratch()<cr>
nnoremap <Leader>rvc :call VCScratch()<cr>
nnoremap <Leader>rs :term scheme --quiet --load %<cr><c-d>
nnoremap <Leader>am :call ApueMake()<cr><c-d>
nnoremap <Leader>cm :call CMake()<cr><c-d>
nnoremap <Leader>vcm :call VCMake()<cr><c-d>
nnoremap <Leader>gr :cd `=GITROOT`<cr>:e 
nnoremap <Leader>grt :cd `=GITROOT`<cr>:tabedit 
nnoremap <Leader>grh :cd `=GITROOT`<cr>:sp 
nnoremap <Leader>grv :cd `=GITROOT`<cr>:vs 

call plug#begin('~/.vim/plugged')

Plug 'kien/rainbow_parentheses.vim'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'christoomey/vim-tmux-navigator'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'

call plug#end()
set guioptions-=e  "make tabs look like the ones in the console."
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

fun! ApueMake()
        term bash -c "make -f ../Makefile vimmake ERROR=../error.o SOURCE=%:p && ./a.out"
endfun

fun! CMake()
        term bash -c "make && ./a.out"
endfun

fun! VCMake()
        term bash -c "make && valgrind ./a.out"
endfun

fun! CScratch()
        term bash -c "gcc -Wall -g -o a.out % && ./a.out"
endfun

fun! VCScratch()
        term bash -c "gcc -Wall -g -o a.out % && valgrind ./a.out"
endfun

fun! GoDebug()
        term bash -c "go build -gcflags=all='-N -l'"
endfun
