source $HOME/.config/nvim/common.init.vim
if exists('g:gui_oni')
    source $HOME/.config/nvim/oni.init.vim
else
    source $HOME/.config/nvim/default.init.vim
endif
