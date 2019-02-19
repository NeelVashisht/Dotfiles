set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
"Plugin 'sjl/badwolf'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'rust-lang/rust.vim'
Plugin 'morhetz/gruvbox'

call vundle#end()

filetype indent on
filetype plugin on
syntax on
let g:airline_theme='badcat'
set cursorline
"hi CursorLine ctermbg=236 cterm=bold
set lazyredraw
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

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

nmap <silent> <C-a> :NERDTreeToggle<CR>
map t gt
map T gT

"let g:rustfmt_autosave = 1

"YCM compile flag error fix
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

function! DSWI(stat)
    let l:extension = expand('%:t:e')
    let l:file_name = expand('%:t')

        if extension == "c"
            if a:stat == "build"
                exec "! gcc" l:file_name "-o" expand('%:t:r')
            elseif a:stat == "run"
                exec "! gcc " l:file_name "-o tmp.out && ./tmp.out"
            endif
        elseif extension == "cpp"
            if a:stat == "build"
                exec "! g++" l:file_name "-o" expand('%:t:r')
            elseif a:stat == "run"
                exec "! g++ " l:file_name "-o /tmp/a.out && /tmp/a.out"
            endif
        elseif extension == "go"
            if a:stat == "run"
                exec "! go run" l:file_name
            else
                exec "! go build" l:file_name
            endif
        elseif extension == "py"
            if a:stat == "run"
                exec "! python3" l:file_name
            else
                exec "! python" l:file_name
            endif
        elseif extension == "rs"
            if a:stat == "run"
                exec "! cargo run"
            else
                exec "! cargo build"
            endif
        elseif extension == "sh"
            if a:stat == "run"
                exec "! bash" l:file_name
            else
                exec "! sh" l:file_name
            endif
        elseif extension == "lua"
                exec "! lua5.3" l:file_name
        else
            echo "File type not supported:" l:extension
        endif

endfunction

nmap <silent> } :call DSWI("run")<CR>
nmap <silent> ] :call DSWI("build")<CR>
