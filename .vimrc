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

"Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-syntastic/syntastic'

Plugin 'rust-lang/rust.vim'

"Plugin 'racer-rust/vim-racer'

call vundle#end()

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

nmap <silent> <C-a> :NERDTreeToggle<CR>

"let g:rustfmt_autosave = 1

"let g:racer_experimental_completer = 1

"YCM compile flag error fix
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


function! DSWI(stat)
    let l:extension = expand('%:t:e')
    let l:file_name = expand('%:t')

        if extension == "c"
            if a:stat == "build"
                exec "! gcc" l:file_name "-o" expand('%:t:r')
            elseif a:stat == "run"
                exec "! gcc " l:file_name "-o a.out && ./a.out"
            endif
        elseif extension == "cpp"
            exec "! g++" l:file_name "-o" expand('%:t:r')
            if a:stat == "run"
                exec "! g++ " l:file_name "-o a.out && ./a.out"
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
        else
            echo "File type not supported:" l:extension
        endif

endfunction

nmap <silent> } :call DSWI("run")<CR>
nmap <silent> ] :call DSWI("build")<CR>
