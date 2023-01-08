#!/bin/sh

if [ ! -d "$HOME/bin" ]; then
    mkdir "$HOME/bin"
fi

ln -sf "$PWD/dotupdate" "$HOME/bin/dotupdate"
