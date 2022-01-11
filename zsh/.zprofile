# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Extend path
export PATH="$HOME/.local/bin:$PATH"
export PATH="/data/own/Linux/bin:$PATH"
export PATH="/data/own/Linux/bin/pico-8:$PATH"
export PATH="/data/own/Linux/scripts:$PATH"
export PATH="/data/own/Linux/scripts/dmenu-scripts:$PATH"
export PATH="/data/bin/opals/opals:$PATH"

# Standard programs
export TERMINAL="lxterminal"
export EDITOR="vim"
export BROWSER="vivaldi"
export PDFVIEWER="okular"

# Some paths
export OWNCLOUDDIR="/data/own"
export AITDOCSDIR="/data/ait"
export AITMKDOCSDIR="/data/ait/mkdocs"
export AITNOTESDIR="/data/ait/quick-notes"
export BACKUPDIR="/media/philipp/ait-backup/backup-zips"
export BROWSER_BOOKMARKS="$HOME/.bookmarks/browser-bookmarks"
export DIR_BOOKMARKS="$HOME/.bookmarks/dir-bookmarks"
export DOTDIR="/data/own/Linux/dot"
export FILE_BOOKMARKS="$HOME/.bookmarks/file-bookmarks"
export LATEXDIR="/data/own/Latex/projects"
export LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib
export LITERATUREDIR="/data/own/Literatur"
export MUSICDIR="/data/own/Medien/Musik-Alben"
export PRJDIR="/data/prj"
export REPOSDIR="/data/repos" # split with ":"
export ROS_WORKSPACE_ROOT="/data/ros-ws"
export SCROTDIR="/data/own/Screenshots/PC/"$(date +"%Y")
export TASKDATA="/data/ait/tasks"
export WALLPAPER="/data/own/Linux/wallpapers/ait-blue_21-to-9.png"
export XDG_CONFIG_HOME="$HOME/.config"

# Other
export HIGHLIGHT_COLOR="#0087FF"
# export QT_QPA_PLATFORMTHEME=gtk2 # use gtk themes for qt applications, needs "sudo apt install qt5-style-plugins"
export XDG_CURRENT_DESKTOP=KDE

# Options for dmenu
export DMENU_OPTIONS="-i"

# Install ruby gems to ~/gems (from jekyll, see https://jekyllrb.com/docs/installation/ubuntu/)
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

