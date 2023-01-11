#!/bin/sh

symlink_file() {
    src="$1"
    dst="$2"
    name="$3"

    ln -sf "$src/$name" "$dst/$name"
}

install_dir="$HOME/.local/share/konsole"

if [ ! -d $install_dir ]; then
    mkdir -p $install_dir
fi

symlink_file $PWD/themes/catpuccin $install_dir Catppuccin-Frappe.colorscheme
symlink_file $PWD/themes/catpuccin $install_dir Catppuccin-Latte.colorscheme
symlink_file $PWD/themes/catpuccin $install_dir Catppuccin-Macchiato.colorscheme
symlink_file $PWD/themes/catpuccin $install_dir Catppuccin-Mocha.colorscheme

