syntax on

set nocompatible
set smartindent
set shiftwidth=4
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
" Vim usually has its own clipboard and ignores the system keyboards, but 
" sometimes you might want to cut, copy, paste to/from other applications outside of VIM
set clipboard=unnamed

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

set mouse=a

filetype off 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim


"-------------- PLUGINS STARTS -----------------
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'airblade/vim-gitgutter'
" perform basic git commands without leaving the comfort of VIM
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'flazz/vim-colorschemes'

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
" The best plugin for Python auto-complete
Plugin 'Valloric/YouCompleteMe'
" PEP8 checking
Plugin 'nvie/vim-flake8'
" Powerline is a status bar that displays things like the current 
" virtualenv,git branch, files being edited, and much more
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()  
"-------------- PLUGINS END --------------------
filetype plugin indent on


"----- GENERAL SETTINGS-------
set laststatus=2
set guifont=Monaco:h14
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'

let g:SimpylFold_docstring_preview=1

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" mark extra whitespace as bad, and probably color it red
" Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" shoulds use UTF8 when working with Python, especially Python 3.
set encoding=utf-8

" ensures that the autocomplete window goes away when you’re done with it
let g:ycm_autoclose_preview_window_after_completion=1
" defines a shortcut for goto definition, space-g will goto definition of
" whatever I’m currently on
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support.  This determines if you are running inside
" a virtualenv, and then switches to that specific virtualenv and sets up 
" your system path so that YouCompleteMe will find the appropriate site packages.

" let g:ycm_python_binary_path = 'python'

"python3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
"EOF

let python_highlight_all=1
syntax on

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


"---------NERD-TREE SETTINGS----------
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1


"-------- SYNTASTIC SETTINGS---------
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"

augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END


"-------- TAGS SETTINGS --------------------------------
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
let g:tagbar_autoclose=2

" nmap <F8> :TagbarToggle<CR>
nmap <silent> <leader>b :TagbarToggle<CR>
"autocmd BufEnter * nested :call tagbar#autoopen(0)

"---------GIT SETTINGS--------------
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1


"----------DELIMITEMATE SETTINGS-----------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"-----------TMUX SETTINGS--------------
let g:tmux_navigator_save_on_switch = 2
nmap <F8> :TagbarToggle<CR>

