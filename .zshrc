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
alias py3=python3
alias vi=vim
alias vr="vim -M"


# Go env setup
export PATH=$PATH:/usr/local/go/bin

# autojump
. /usr/share/autojump/autojump.sh

# didn"t work somehow, so
#export PATH="$HOME/.cargo/bin:$PATH"

