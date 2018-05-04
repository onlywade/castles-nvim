filetype plugin indent on

call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/vimwiki'
Plug 'justinmk/vim-sneak'
call plug#end()

" Set color, miscellaneous formatting options
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=light
colorscheme solarized
set number
set ruler
set encoding=utf-8
set colorcolumn=120



" Status bar
set laststatus=2

" vimwiki config
filetype plugin on
map <Leader>d :VimwikiToggleListItem<CR>
let g:vimwiki_list = [{'path': '/Users/wcatron/vimwiki/'}]

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

