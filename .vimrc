set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/badwolf'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rust-lang/rust.vim'

call vundle#end()

nmap <silent> <C-a> :NERDTreeToggle<CR>

filetype indent on

syntax on
colorscheme badwolf
let g:airline_theme='badcat'
set cursorline
hi CursorLine   cterm=bold  ctermbg=234  ctermfg=NONE
set lazyredraw

set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set smartindent

set showmatch
set smartcase
"set hlsearch
"set gdefault

"For faster checking of small cpp programs
map ` : <bar> exec
            \ '!g++ ' .shellescape('%').
            \ ' -o ' .shellescape('%:r').
            \ ' && ./' .shellescape('%:r') <CR>

"YCM compile flag error fix
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

