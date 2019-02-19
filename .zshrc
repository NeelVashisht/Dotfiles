export ZSH=/home/neva/.oh-my-zsh

# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

HYPHEN_INSENSITIVE="true"

export UPDATE_ZSH_DAYS=13

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="dd.mm.yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

#plugins=(git)

source $ZSH/oh-my-zsh.sh

# export SSH_KEY_PATH="~/.ssh/rsa_id"

FUN="$HOME/Fun"

alias w3d="w3m duckduckgo.com"
alias fuck="rm -f"
alias open=xdg-open
alias la="ls -a"
alias lla="ls -la"
alias cdd="cd ~/Desktop"
alias cdf="cd $FUN"
alias cdg="cd $FUN/go"
alias cdp="cd $FUN/py"
alias cdr="cd $FUN/rust"
alias cdcp="cd $FUN/cpp"
alias ngrok="$FUN/exec/ngrok"
alias dbx="$FUN/exec/dbxcli"
alias py=python
alias venv2="source ~/Desktop/venv/venv2/bin/activate"
alias py3=python3
alias venv3="source ~/Desktop/venv/venv3/bin/activate"
alias vi=vim
alias vr="vim -M"
alias lua=lua5.3

# autojump
. /usr/share/autojump/autojump.sh

function screen_record() {
    output=""
    if [ -z $1 ]; then
        output="$(date +%Y-%m-%d-%H-%M).mkv"
    else
        output="$1"
    fi
    # ffmpeg -f x11grab -s 1920x1080 -i :0.0 $output
    ffmpeg -f x11grab -s 1920x1080 -i :0.0 -f alsa -i default $output
}

function video_record() {
    output=""
    if [ -z $1 ]; then
        output="$(date +%Y-%m-%d-%H-%M).mkv"
    else
        output="$1"
    fi
    ffmpeg -i /dev/video0 $output
}
