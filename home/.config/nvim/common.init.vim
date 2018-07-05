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
call plug#end()

set autoindent
set smartindent
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set omnifunc=syntaxcomplete#Complete
setlocal nospell
setlocal formatoptions=ctnqro
setlocal comments+=n:*,n:#
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

" vimwiki config
filetype plugin on
map <Leader>d :VimwikiToggleListItem<CR>
let g:vimwiki_list = [{'path': '/Users/wcatron/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Script exec shortcuts
map <Leader>r :!ruby %<CR>
map <Leader>p :!python %<CR>

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
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$']
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

