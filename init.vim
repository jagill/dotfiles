"""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off  " Must do this for vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins
"
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'terryma/vim-expand-region'
Plugin 'inkarkat/vim-ReplaceWithRegister'
" Plugin 'ycm-core/YouCompleteMe'  " This requires compiling; see docs
" Plugin 'joshdick/onedark.vim'
" Plugin 'itchyny/lightline.vim'
" Plugin 'fholgado/minibufexpl.vim'
" Plugin 'vim-scripts/IndexedSearch.git'
" Plugin 'vim-scripts/Mark.git'
" Plugin 'vim-scripts/ReplaceWithRegister.git'
" Plugin 'majutsushi/tagbar'
" Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on  " Re-enable this after Vundle Plugins.

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Base options
"""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden          " Allow buffers to be hidden without writing, and remember their marks.
set autowrite       " Autosave when I use tags, switch buffers, etc
set backup          " keep a backup file
set history=50      " keep 50 lines of command line history

set number          " show line numbers
set title           " Show title of file in terminal mode

set ignorecase smartcase        " make searching case-insensitive, unless there's a capital letter in it

set shiftwidth=2    " 2 space indents
set expandtab       " don't use tab characters
set softtabstop=2   " make the tab key move 2 spaces
set tabstop=4       " tabs show as 4 spaces. Makes them more obvious.

" Search down into subfolders
" Provides tab-completion for all file-related tasks
" set path+=**
" Only complete up to points of ambiguity
" You can also toggle through the matches by tab
set wildmode=list:longest,full
"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*~,*.pyc,*.pyo

set mouse=a     " this enables vim mouse handling, and mucks up cut-paste from putty
set mouseshape=i:beam

set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:< "Show invisble characters with :set list

" Press Space to turn off highlighting and clear any message already
" displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Make Y work consistently with C and D
nmap Y y$

" Reload .vimrc
map <silent> <Leader>V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Abbreviations
" Alias %% to the directory of the current file.
cabbr <expr> %% expand('%:p:h')

" au TextYankPost * silent! lua vim.highlight.on_yank()
" augroup highlight_yank
"     autocmd!
"     autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 1000)
" augroup END

if has('termguicolors')
  set termguicolors   " Enable gui colors in terminal vim
endif
set background=dark
"silent! colorscheme onedark
silent! colorscheme palenight
