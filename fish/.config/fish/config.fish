set -x EDITOR 'nvim'
set -x DOT $HOME/dotfiles
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/Work/go
set -x GOPRIVATE "172.16.40.5"
set -x KITTY_DISABLE_WAYLAND 1
set -x PATH $PATH:$GOROOT/bin:$GOPATH/bin:$HOME/bin:$HOME/usr/bin
set -x PATH $PATH:$HOME/.local/bin

alias t="tmux -2 -u"
alias tns="tmux -2 -u new-session -s"
alias tls="tmux -2 list-session"
alias tas="tmux -2 attach -t"
#alias nvim="TERM='' nvim"
alias nv="nvim"
alias vi="nvim"
alias vim="nvim"
#alias ls="ls --color=never"
alias ls="exa"
alias kssh='kitty +kitten ssh '
alias ksshno='kitty +kitten "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"'
alias sshno='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o HostKeyAlgorithms=+ssh-rsa'
alias scpno='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o HostKeyAlgorithms=+ssh-rsa'
alias ssh6n='ssh -6 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o HostKeyAlgorithms=+ssh-rsa'
alias scp6n='scp -6 -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o HostKeyAlgorithms=+ssh-rsa'
alias ssh6='ssh -6'
alias scp6='scp -6'
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias bat='bat --theme="base16"'
#alias gotop='gotop -c default-dark'
alias enw='emacs -nw'

alias gt='git status'
alias glo='git log --oneline'
alias glog='git log --oneline --graph'
alias gc="git commit -v"
alias gcp="git commit -v -p"
alias gca="git commit -v -a"

alias :q='exit'
alias :qall='exit'
