"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
":PlugInstall

syntax on
set encoding=utf-8
set background=dark
set t_Co=256
color darkblue
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=indent,eol,start

set hlsearch
highlight Visual cterm=bold ctermbg=DarkMagenta ctermfg=NONE
highlight Search cterm=bold ctermbg=DarkMagenta ctermfg=NONE
set hidden

set cursorline
highlight CursorLine term=bold cterm=bold ctermbg=NONE guibg=black
set cursorcolumn
highlight CursorColumn term=bold cterm=bold ctermbg=NONE guibg=black


call plug#begin('~/.vim/plugged')

" Tagbar
Plug 'vim-scripts/Tagbar'
map <C-J> :Tagbar<CR>
Plug 'vim-scripts/ctags.vim'

" cscope_maps: :cscope
Plug 'vim-scripts/cscope_macros.vim'

" nvim auto complete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
map <C-K> :Buffers<CR>
map <C-P> :Files<CR>
map <C-N> :Rg!<C-R><C-W><CR>
nmap sr :History: <CR>
nmap s/: History/ <CR>

" Rainbow
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" NerdCommenter
let mapleader="\\"
Plug 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1

" easy-motion
Plug 'Lokaltog/vim-easymotion'
map f <Plug>(easymotion-bd-w)
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'SADFJKLEWCMPGH'

call plug#end() 
