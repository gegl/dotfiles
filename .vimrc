set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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
Bundle 'slim-template/vim-slim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'bling/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required

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
let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
let g:solarized_termcolors = 16
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
autocmd BufWritePre * :%s/\s\+$//e

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

" Modified rspec cmd to be able ^t on individual specs with RSpec 3
let g:rubytest_cmd_example = "bundle exec rspec %p:%c"
let g:rubytest_cmd_spec = "bundle exec rspec %p"

" Add files that should use Ruby syntax highlighting etc
autocmd BufNewFile,BufRead *.cap set filetype=ruby
autocmd BufNewFile,BufRead *.eye set filetype=ruby
autocmd BufNewFile,BufRead *.arb set filetype=ruby
autocmd BufNewFile,BufRead *.etl set filetype=ruby

" Ease navigating help
autocmd Filetype help nnoremap <buffer> <CR> <C-]>
autocmd Filetype help nnoremap <buffer> <BS> <C-T>
autocmd Filetype help nnoremap <buffer> o /'\l\{2,\}'<CR>
autocmd Filetype help nnoremap <buffer> O ?'\l\{2,\}'<CR>
autocmd Filetype help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
autocmd Filetype help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>
