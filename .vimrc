"============================PLUGINS=============================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif			"AUTOINSTALL PLUG

call plug#begin('~/.vim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'junegunn/goyo.vim'            " Minimal vim to concentrate
    Plug 'airblade/vim-gitgutter'       " GIT status along lines
    Plug 'lervag/vimtex'		" Latex syntax highlighting
    Plug 'sirver/ultisnips'		" Snippets
    Plug 'KeitaNakamura/tex-conceal.vim'
    Plug 'dylanaraps/wal'		" pywal color
call plug#end()

"Powerline"
set  rtp+=/usr/local/lib/python3.6/dist-packages/powerline/bindings/vim/
set laststatus=2
set showtabline=1
set noshowmode
set t_Co=256

"----------------------------GENERAL-----------------------------
set linebreak
set showbreak=+++
set textwidth=100
set showmatch

filetype plugin indent on
syntax on

set number relativenumber   " Show line numbers
set linebreak               " Break lines at word (requires Wrap lines)
set showbreak=+++           " Wrap-broken line prefix
set textwidth=100           " Line wrap (number of cols)
set showmatch               " Highlight matching brace

set hlsearch                " Highlight all search results
set hls is
set smartcase               " Enable smart-case search
set ignorecase              " Always case-insensitive
set incsearch               " Searches for strings incrementally

set autoindent              " Auto-indent new lines
set cindent                 " Use 'C' style program indenting
set shiftwidth=4            " Number of auto-indent spaces
set smartindent             " Enable smart-indent
set smarttab                " Enable smart-tabs
set tabstop=8			"Set for C Programming"
set softtabstop=4           " Number of spaces per Tab
set backspace=indent,eol,start
"set colorcolumn=110

set autoread
set wildmenu

"===========================KEYBINDING=========================
map <C-g> :Goyo<CR>
map <C-h> :Goyo 120<CR>


map <Up>    :resize +2<CR>
map <Down>  :resize -2<CR>
map <Right> :vertical resize +2<CR>
map <Left>  :vertical resize -2<CR>




"===========================COLORS=========================
color default
hi comment term=bold ctermfg=4 guifg=#406090		"Comments are blue"
hi LineNr term=underline ctermfg=3 guifg=Red3		"Color for line number"
hi Statement cterm=none ctermfg=yellow			"Color of statements"
colorscheme wal
set background=dark


"===========================LATEX=========================
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1		"Latex code is made invisible when cursor not on line
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

"setlocal spell
"set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

function! Synctex()
    " remove 'silent' for debugging
    execute "silent !zathura --synctex-forward" . line('.') . ":" . col('.') . ":" . bufname(%) . " " .g:syncpdf
endfunction
map <C-enter> :call Synctex()<cr>

"===========================SNIPPETS=========================
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"

