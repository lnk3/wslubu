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
    Plug 'jreybert/vimagit'		" git in vim
    Plug 'ajh17/VimCompletesMe'
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
set showbreak=-->           " Wrap-broken line prefix
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
set wildmode=longest,list,full	"Autocompletion
set splitbelow splitright   " Splitting corrected

"Disable autocommenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"set colorcolumn=110

set autoread
set wildmenu

"===========================KEYBINDING=========================
map <C-f> :Goyo \| set linebreak<CR>
map <C-F> :Goyo 120<CR>


map <Up>    :resize +2<CR>
map <Down>  :resize -2<CR>
map <Right> :vertical resize +2<CR>
map <Left>  :vertical resize -2<CR>

"Navigate between splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Compile document script
map <leader>c :w! \| !compiler <c-r>%<CR><CR>

" Oper corresponding .pdf/.html file
map <leader>p :!opout <c-r>%<CR><CR>


"===========================COLORS=========================
color default
"Comments are blue
hi comment term=bold ctermfg=4 guifg=#406090		
"Color for line number
hi LineNr term=underline ctermfg=3 guifg=Red3		
"Color of statements
hi Statement cterm=none ctermfg=yellow			

"Pywal
colorscheme wal
set background=dark


"===========================LATEX=========================
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode=0
set conceallevel=1		"Latex code is made invisible when cursor not on line
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

function! Synctex()
    " remove 'silent' for debugging
    execute "silent !zathura --synctex-forward" . line('.') . ":" . col('.') . ":" . bufname(%) . " " .g:syncpdf
endfunction

map <C-Enter> :call Synctex()<CR> 
" Clear latex build files when closing .tex file
autocmd VimLeave *.tex !VimtexClean %

"===========================SNIPPETS=========================
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit="vertical"

"===========================VIMCOMPLETESME=========================
augroup VimCompletesMeTex
    autocmd!
    autocmd FileType tex
	\ let b:vcm_omni_pattern = g:vimtex#re#neocomplete
augroup END
let g:UltiSnipsExpandTrigger = '<tab>'
