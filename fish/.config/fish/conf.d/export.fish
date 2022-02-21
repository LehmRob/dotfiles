set -x EDITOR 'nvim'
set -x DOT $HOME/dotfiles
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/Work/go
set -x GOPRIVATE "172.16.40.5"
set -x KITTY_DISABLE_WAYLAND 1
set -x PATH $PATH:$GOROOT/bin:$GOPATH/bin:$HOME/bin:$HOME/usr/bin
set -x PATH $PATH:$HOME/.local/bin
