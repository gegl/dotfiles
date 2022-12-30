lua require('plugins')

" Theme
colorscheme dracula

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

" Ease ESCaping insert mode
:imap jj <Esc>

" Incremental searching is sexy
set incsearch

" We want numbered lines
set nu

" Enable CSS syntax highlighting for lit-html
let g:htl_css_templates = 1

" Tests
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
