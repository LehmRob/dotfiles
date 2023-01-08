#!/bin/sh

if [ ! -d "$HOME/.config/systemd/user" ]; then
    mkdir -p "$HOME/.config/systemd/user"
fi

ln -sf "$PWD/ssh-agent.service" "$HOME/.config/systemd/user/ssh-agent.service"

if [ ! -e "$HOME/.config/systemd/user/default.target.wants/ssh-agent.service" ]; then
    systemctl --user enable --now ssh-agent.service
fi
