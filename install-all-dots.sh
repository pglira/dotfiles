#!/bin/sh

set -e

notify-send "Update of dotfiles started!"

case "$(hostname)" in
    L1AS12 )
        ./install-program-dots.sh appimages
        ./install-program-dots.sh bash --merge-tags "L1AS12"
        ./install-program-dots.sh dunst
        ./install-program-dots.sh fonts
        ./install-program-dots.sh i3 --merge-tags "work"
        ./install-program-dots.sh i3blocks
        ./install-program-dots.sh ipe
        ./install-program-dots.sh keepmenu
        ./install-program-dots.sh jetbrains
        ./install-program-dots.sh latex
        ./install-program-dots.sh lxterminal
        ./install-program-dots.sh matlab
        ./install-program-dots.sh moc
        ./install-program-dots.sh mpv
        ./install-program-dots.sh newsboat
        ./install-program-dots.sh passwords --merge-tags "work"
        ./install-program-dots.sh readline
        ./install-program-dots.sh sxiv
        ./install-program-dots.sh spacevim
        ./install-program-dots.sh tmux
        ./install-program-dots.sh vifm
        ./install-program-dots.sh xmodmap
        ./install-program-dots.sh xresources
        ;;
    L1AS19 )
        ./install-program-dots.sh appimages
        ./install-program-dots.sh bash --merge-tags "L1AS19"
        ./install-program-dots.sh dunst
        ./install-program-dots.sh fonts
        ./install-program-dots.sh i3 --merge-tags "work"
        ./install-program-dots.sh i3blocks
        ./install-program-dots.sh ipe
        ./install-program-dots.sh keepmenu
        ./install-program-dots.sh jetbrains
        ./install-program-dots.sh latex
        ./install-program-dots.sh lxterminal
        ./install-program-dots.sh matlab
        ./install-program-dots.sh moc
        ./install-program-dots.sh mpv
        ./install-program-dots.sh newsboat
        ./install-program-dots.sh passwords --merge-tags "work"
        ./install-program-dots.sh readline
        ./install-program-dots.sh sxiv
        ./install-program-dots.sh spacevim
        ./install-program-dots.sh tmux
        ./install-program-dots.sh vifm
        ./install-program-dots.sh xmodmap
        ./install-program-dots.sh xresources
        ;;
esac

notify-send "Update of dotfiles completed!"
