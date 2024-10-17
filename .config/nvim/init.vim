set nocompatible
set showmatch
set ignorecase
set mouse=v
set mouse=a
set hlsearch
set incsearch
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent
set number
set relativenumber
set wildmode=longest,list
set cc=80
syntax on
set cursorline
set ttyfast
set backupdir=~/.cache/vim
filetype plugin indent on
filetype plugin on

" Plugins
call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'

call plug#end()
