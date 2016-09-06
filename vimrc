set nocompatible    " don't try to be vi (This must be first)

"""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off  " Must do this for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle plugins
Plugin 'gmarik/vundle'
Plugin 'itchyny/lightline.vim'
Plugin 'lifepillar/vim-solarized8'

filetype plugin indent on  " Re-enable this after Vundle Plugins.

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Base options
"""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler           " Show the cursor position all the time
set number          " show line numbers
set laststatus=2    " Show statusline even when there is only one buffer open
set title           " Show title of file in terminal mode

set hlsearch        " highlight search results 
set incsearch       " do incremental searching
set ignorecase smartcase        " make searching case-insensitive, unless there's a capital letter in it

set shiftwidth=2    " 2 space indents
set expandtab       " don't use tab characters
set softtabstop=2   " make the tab key move 2 spaces
set tabstop=4       " tabs show as 4 spaces. Makes them more obvious.

set wildmenu        " Show all possible word completions
" Only complete up to points of ambiguity
" You can also toggle through the matches by tab
set wildmode=list:longest,full  
"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*~,*.pyc,*.pyo

set mouse=a     " this enables vim mouse handling, and mucks up cut-paste from putty
set mouseshape=i:beam
set termguicolors   " Enable gui colors in terminal vim 

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< "Show invisble characters with :set list

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch syntax highlighting on
"""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
silent! colorscheme solarized8_dark_high

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Use different cursor shapes for the different modes.
"""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundle configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Modify lightline scheme.
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""
" commands
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Make Y work consistently with C and D
nmap Y y$

" Reload .vimrc
map <silent> <Leader>V :source $HOME/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Abbreviations
" Alias %% to the directory of the current file.
cabbr <expr> %% expand('%:p:h') 


