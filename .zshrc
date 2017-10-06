# Path to oh-my-zsh installation.
  export ZSH=/home/blazing/.oh-my-zsh

# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"


HYPHEN_INSENSITIVE="true"

export UPDATE_ZSH_DAYS=13

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

# plugins found in ~/.oh-my-zsh/plugins/*
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh


# User configuration

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias w3g='w3m google.com'
alias w3d='w3m duckduckgo.com'
alias fuck='rm -f'
alias open=xdg-open
alias gtop='LANG=en_US.utf8 TERM=xterm-256color gtop'
alias la='ls -a'
alias cdd='cd ~/Desktop'
alias cdf='cd ~/Desktop/Fun'
alias cdg='cd ~/go'
alias cdp='cd ~/Desktop/Fun/Py'
alias cdr='cd ~/Desktop/Fun/Rust'

#Building single c, cpp, go, rust files
function bp() {
    if [ -z $1 ]; then
        echo "Usage: bp [FILE] [OPTIONS]\nBuilds single C, C++, Go and Rust files"

    else
        var=$1
        num=${#1}
        if [[ $var == *".cpp" ]]; then
            let "num-=4"
            g++ -std=c++14 $1 -o ${var:0:$num} $2 $3 $4 $5
        elif [[ $var == *".c" ]]; then
            let "num-=2"
            gcc $1 -o ${var:0:$num} $2 $3 $4 $5
        elif [[ $var == *".go" ]]; then
            go build $1 $2 $3 $4 $5
        elif [[ $var == *".rs" ]]; then
            #rustc $1 $2 $3 $4 $5
            cargo build
        else
            echo "Error: Unrecognised file type"
        fi
    fi
}

#Building + running single c, cpp, go, rust,  python3.x files
function rp() {
    if [ -z $1 ]; then
        echo "Usage: rp [FILE] [OPTIONS]\nBuilds & runs, or directly runs single C, C++, Go, Rust and Python3.x files"
    else
        var=$1
        num=${#1}
        if [[ $var == *".cpp" ]]; then
            let "num=-4"
            exe=${var:0:$num}
            g++ -std=c++14 $1 -o $exe $2 $3 $4 $5
            ./$exe
        elif [[ $var == *".c" ]]; then
            let "num-=2"
            exe=${var:0:$num}
            gcc $1 -o $exe $2 $3 $4 $5
            ./$exe
        elif [[ $var == *".go" ]]; then
            go run $1 $2 $3 $4 $5
        elif [[ $var == *".py" ]]; then
            python3 $var
        elif [[ $var == *".rs" ]]; then
            let "num-=3"
            #rustc $1 $2 $3 $4 $5
            #./${var:0:$num}
            cargo run $1 $2 $3 $4 $5
        else
            echo "Error: Unrecognised file type"
        fi
    fi
}

#Go env setup
GOPATH=/home/blazing/go
export GOPATH
export PATH=$PATH:$GOPATH/bin
