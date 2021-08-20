# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# Eternal bash history (from https://stackoverflow.com/a/19533853)
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE="${HOME}/oc/Linux/bash-eternal-history/$(date +%Y_%m)_$(hostname)_bash-history"
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

# Generated with http://bashrcgenerator.com
export PS1="\[\033[48;5;33m\][\$?][\W]:\[$(tput sgr0)\] \[$(tput sgr0)\]"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

eval $(dircolors -b $HOME/.dircolors)

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND="find ." # find also hidden files
# https://minsw.github.io/fzf-color-picker/
export FZF_COLORS="--color=preview-fg:#ffffff,fg:#999999,bg:#111111,hl:#ffff00 --color=fg+:#ffffff,bg+:#0087ff,hl+:#ffff00 --color=info:#ffff00,prompt:#ffffff,pointer:#ffffff --color=marker:#ffffff,spinner:#ffff00,header:#0087ff"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse $FZF_COLORS"

# tmux
# If not running interactively, do not do anything
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# Disable C-s in terminal so that it can be used in other programe, e.g. vim
stty -ixon
