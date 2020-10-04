"============================PLUGINS=============================
call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'junegunn/goyo.vim'		" Minimal vim to concentrate
    Plug 'airblade/vim-gitgutter'	" GIT status along lines
call plug#end()

"=============================GENERAL=============================

set backspace=indent,eol,start

"----Spaces and tabs---->
set shiftwidth=4	    " Number of auto-indent spaces
set softtabstop=4	    " Number of spaces per Tab
set smarttab		    " Enable smart-tabs

"----GUI---->
filetype plugin indent on
syntax on
set number relativenumber   " Show line numbers
set showcmd
set cursorline
set showmatch		    " Highlight	matching brace
set linebreak		    " Break lines at word (requires Wrap lines)
set textwidth=100	    " Line wrap (number of cols)

"----Search---->
set hlsearch		    " Highlight all search results
set hls is
set smartcase		    " Enable smart-case search
set ignorecase		    " Always case-insensitive
set incsearch		    " Searches for strings incrementally
:hi Search ctermbg=3 ctermfg=8

"----Indentation---->
set autoindent		    " Auto-indent new lines
set cindent		    " Use 'C' style program indenting
set smartindent		    " Enable smart-indent

"----Completion---->
set autoread
set wildmenu

"===========================KEYBINDING=========================
map <C-g> :Goyo<CR>
map <C-h> :Goyo 120<CR>


map <Up>    :resize +2<CR>
map <Down>  :resize -2<CR>
map <Right> :vertical resize +2<CR>
map <Left>  :vertical resize -2<CR> 


"==========================COLORS==============================
" set termguicolors
set background=dark
