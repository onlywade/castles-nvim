
set nocompatible
syntax on
syntax enable
filetype off

set autoindent
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
vnoremap . :norm.<CR>

" change tabstops and stuff for Ruby, HTML
au BufNewFile,BufRead *.gradle setf groovy
autocmd FileType rb, html, groovy setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType groovy setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" Cool mappings
let mapleader = ","
imap jj <Esc>
nmap <C-j> 3j3<C-e>
nmap <C-k> 3k3<C-y>

" Script exec shortcuts
map <Leader>r :!ruby %<CR>
map <Leader>p :!python %<CR>
map <Leader>t :!/Users/u524/work/sse_tests/bin/run.sh %<CR>

" Nerttree shortcuts
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
