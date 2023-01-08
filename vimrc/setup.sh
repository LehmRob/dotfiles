#!/bin/sh

ln -sf "$PWD/.vimrc" "$HOME/.vimrc"

if [ ! -d "$HOME/.vim/autoload" ]; then
    mkdir -p "$HOME/.vim/autoload"
fi

ln -sf "$PWD/autoload/plug.vim" "$HOME/.vim/autoload/plug.vim"
