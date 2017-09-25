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
alias fuck='rm -f'
alias w3d='w3m duckduckgo.com'
alias open=xdg-open
alias la='ls -a'
alias cdd='cd ~/Desktop'
alias cdf='cd ~/Desktop/Fun'
alias cdg='cd ~/go'
alias cdp='cd ~/Desktop/Fun/Py'

#Building single C, C++ and Go files
function bp() {
    if [ -z $1 ]; then
        echo "Usage: bp [FILE] [OPTIONS]\nBuilds single C, C++ and Go files"

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
            let "num-=2"
            go build $1 $2 $3 $4 $5
        else
            echo "Error: Unrecognised file type"
        fi
    fi
}

#Building + running single C, C++, Python3.x files
function rp() {
    if [ -z $1 ]; then
        echo "Usage: rp [FILE] [OPTIONS]\nBuilds & runs, or directly runs single C, C++, Go and Python3.X files"
    else
        var=$1
        num=${#1}
        if [[ $var == *".cpp" ]]; then
            let "num=-4"
            exe=${var:0:$num}
            g++ $1 -o $exe $2 $3 $4 $5
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
        else
            echo "Error: Unrecognised file type"
        fi
    fi
}

#Go env setup
GOPATH=/home/blazing/go
export GOPATH
export PATH=$PATH:$GOPATH/bin
