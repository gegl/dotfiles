set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Core Bundle
Bundle 'gmarik/vundle'

" Your Bundles Here
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ctrlp.vim'
Bundle "scrooloose/nerdtree.git"
Bundle 'janx/vim-rubytest'
Bundle 'vim-scripts/vim-auto-save'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'kana/vim-textobj-user' 
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-bundler'
Bundle 'mileszs/ack.vim'

let mapleader = ","

" Easy window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Disable arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Ease ESCaping insert mode
:imap jj <Esc>

" Settings
filetype plugin indent on
syntax enable
set background=dark
set t_Co=256
let g:solarized_termcolors = 256
colorscheme solarized

" Fix issue with not able to open directories, ref:  https://github.com/scrooloose/nerdtree/issues/108
let g:NERDTreeDirArrows=0

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" Don't produce .swp files
set nobackup
set nowritebackup
set noswapfile

" Whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab

" Always save on buffer updates
let g:auto_save = 1  

" Turn off automatic setting of CtrlP work dir on each invocation
let g:ctrlp_working_path_mode = 0

" Extend % to work on keyword pairs
runtime macros/matchit.vim

" Incremental searching is sexy
set incsearch

" Highlight things that we find with the search
set hlsearch

" We want numbered lines
set nu
