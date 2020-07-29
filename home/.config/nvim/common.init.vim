set nocompatible
syntax on
syntax enable
"set termguicolors

filetype plugin on

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/vimwiki'
Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'maksimr/vim-jsbeautify'
call plug#end()

set autoindent
set smartindent
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
setlocal nospell
setlocal formatoptions=ctnqro
set comments=n:*,n:#,b:-
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
noremap <Leader>Y "*y
noremap <Leader>P "*p

" vimwiki config
map <Leader>d :VimwikiToggleListItem<CR>
let g:vimwiki_list = [{'path': '/Users/wcatron/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Script exec shortcuts
map <Leader>p :!python %<CR>
map <Leader>c :!cargo check<CR>
map <Leader>r :!cargo run<CR>
map <Leader>t :!cargo test<CR>

" Nerttree shortcuts
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set omnifunc=syntaxcomplete#Complete
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Cursor restore
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" show and strip extra whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+\%#\@<!$/ containedin=ALL
autocmd BufWritePre *.py,*.xml :%s/\s\+$//e

" NERDTree configuration
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '__pycache__']
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" close all open buffers if the only one left is NERDTree
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

