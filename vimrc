set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Your Plugins Here
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ctrlp.vim'
Plugin 'scrooloose/nerdtree.git'
Plugin '907th/vim-auto-save'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'mileszs/ack.vim'
Plugin 'slim-template/vim-slim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bling/vim-airline'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'janko-m/vim-test'
Plugin 'kburdett/vim-nuuid'

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
let g:solarized_termcolors=256
set t_Co=256
set background=dark
let g:solarized_visibility = "high"
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

" Ignore on fuzzy search
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" Extend % to work on keyword pairs
runtime macros/matchit.vim

" Incremental searching is sexy
set incsearch

" We want numbered lines
set nu

" Modify rspec cmd to use docker & rspec
let g:rubytest_cmd_example = "docker-compose run --no-deps --rm -v $(PWD):/app -w /app ${PWD##*/} bundle exec rspec %p:%c"
let g:rubytest_cmd_spec = "docker-compose run --no-deps --rm -v $(PWD):/app -w /app ${PWD##*/} bundle exec rspec %p"

" Modify vim-test cmds to run inside Docker using custom transformations
function! DockerTransform(cmd) abort
  "return join(["docker-compose run --service-ports --no-deps --rm -v $(PWD):/app -w /app $(basename $(PWD))", a:cmd], " ")
  return join(["docker-compose run --no-deps --rm app", a:cmd], " ")
endfunction
let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#transformation = 'docker'

map <leader>t :TestNearest<cr>
map <leader>T :TestFile<cr>
map <leader>l :TestLast<cr>

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
