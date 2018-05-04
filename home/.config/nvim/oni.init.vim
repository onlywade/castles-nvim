call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/vimwiki'
Plug 'justinmk/vim-sneak'
call plug#end()

set autoindent
set number
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
vnoremap . :norm.<CR>

" for oni
set noswapfile
set smartcase
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set mouse=a

" Cool mappings
let mapleader = ","
imap jj <Esc>
nmap <C-j> 3j3<C-e>
nmap <C-k> 3k3<C-y>

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

setlocal nospell
