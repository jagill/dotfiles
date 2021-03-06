set nocompatible    " don't try to be vi (This must be first)

"""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off  " Must do this for vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugins
Plugin 'gmarik/vundle'
Plugin 'itchyny/lightline.vim'
Plugin 'lifepillar/vim-solarized8'
Plugin 'flazz/vim-colorschemes'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'vim-scripts/IndexedSearch.git'
Plugin 'vim-scripts/Mark.git'
Plugin 'vim-scripts/ReplaceWithRegister.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on  " Re-enable this after Vundle Plugins.

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Base options
"""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden          " Allow buffers to be hidden without writing, and remember their marks.
set autowrite       " Autosave when I use tags, switch buffers, etc
set backup          " keep a backup file
set history=50      " keep 50 lines of command line history

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

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
set wildmenu        " Show all possible word completions
" Only complete up to points of ambiguity
" You can also toggle through the matches by tab
set wildmode=list:longest,full  
"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*~,*.pyc,*.pyo

set mouse=a     " this enables vim mouse handling, and mucks up cut-paste from putty
set mouseshape=i:beam

set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:< "Show invisble characters with :set list

" To transfer?
" set backspace=indent,eol,start  " allow backspacing over everything in insert mode 
" set showcmd         " display incomplete commands
" set shortmess=filnxtToOI     " Suppress many of the "Press RETURN to continue"
" set visualbell      " Don't audibly beep
" set clipboard=unnamed   " Default for all unnamed yank/etc operations to store in system clipboard

"""""""
" From no_plugins talk
"""""""

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch syntax highlighting on
"""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Use different cursor shapes for the different modes.
"""""""""""""""""""""""""""""""""""""""""""""""""""
if has('termguicolors')
  set termguicolors   " Enable gui colors in terminal vim 
  silent! colorscheme solarized8_dark_high
else
  silent! colorscheme solarized8_dark_low
endif

if exists('$TMUX')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  " Not everyone has t_SR
  silent! let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  silent! colorscheme solarized8_dark_high
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  " Not everyone has t_SR
  silent! let &t_SR = "\<Esc>]50;CursorShape=2\x7"
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


"""""""""""""""""""""""""""""""""""""""""""""""""""
" modules configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""

" minibuf
" let g:miniBufExplSortBy = "mru" " Sort buffers by Most Recently Used
let g:miniBufExplCycleArround = 1 " Cycle through buffers
map <C-TAB> :MBEbb<cr> " Backward in MRU order
map <S-C-TAB> :MBEbf<cr> " Forward in MRU order
" map <Leader>be <Plug>MBEOpen<cr>  " Open and/or goto Explorer
" map <Leader>bc <Plug>MBEClose<cr> " Close the Explorer if it's open
" map <Leader>bt <Plug>MBEToggle<cr> " Toggle the Explorer window open and closed.
" map <Leader>bm <Plug>MBEMarkCurrent<cr> " Mark current buffer
