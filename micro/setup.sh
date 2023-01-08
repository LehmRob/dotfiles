#!/bin/sh

set -x

if [ ! -e "$HOME/.config/micro" ]; then
    mkdir -p "$HOME/.config/micro"
fi

ln -sf "$PWD/settings.json" "$HOME/.config/micro/settings.json"
ln -sf "$PWD/bindings.json" "$HOME/.config/micro/bindings.json"
