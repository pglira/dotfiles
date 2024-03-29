#!/usr/bin/env bash

set -eu

notify-send "Update of dotfiles started!"

case "$(hostname)" in
    L1AAS45 )
        ./install-program-dots.sh appimages
        ./install-program-dots.sh bash
        ./install-program-dots.sh bookmarks
        ./install-program-dots.sh dunst
        ./install-program-dots.sh fonts
        ./install-program-dots.sh gdb
        ./install-program-dots.sh i3 --merge-tags "work"
        ./install-program-dots.sh i3blocks
        ./install-program-dots.sh ipe
        ./install-program-dots.sh keepmenu
        ./install-program-dots.sh latex
        ./install-program-dots.sh lxterminal
        ./install-program-dots.sh matlab
        ./install-program-dots.sh mpv
        ./install-program-dots.sh newsboat
        ./install-program-dots.sh pandoc
        ./install-program-dots.sh passwords
        ./install-program-dots.sh pico8
        ./install-program-dots.sh readline
        ./install-program-dots.sh ssh
        ./install-program-dots.sh texstudio
        ./install-program-dots.sh tmux
        ./install-program-dots.sh vifm
        ./install-program-dots.sh vim
        ./install-program-dots.sh vimiv
        ./install-program-dots.sh xmodmap
        ./install-program-dots.sh xresources
        ./install-program-dots.sh zsh
        ;;
esac

notify-send "Update of dotfiles completed!"
