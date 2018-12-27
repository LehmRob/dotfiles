# dotfiles home

this directory contains the dotfiles for the home machine.

## requirements

the following packages needs to be installed on the machine

* make
* neovim (e. g. appimage version)
* tmux
* zsh

## installation

the following steps needs to be executed to install the dotfiles

```
$ make all
# to install oh my zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# to install vim-plugged for neovim
$ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## notes

this project is inspired by the dotfile project of mrnugget (https://github.com/mrnugget/dotfiles)
