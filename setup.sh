#!/bin/sh

# call the different setup.sh scripts in the sub directories
# the inspiration is taken from https://github.com/rwxrob/dot

set -x

for d in bash bin micro systemd tmux vimrc konsole; do
    cd $d && ./setup.sh
    cd -
done
