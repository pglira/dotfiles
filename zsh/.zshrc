# https://scriptingosx.com/2019/06/moving-to-zsh/
HISTFILE=~/oc/Linux/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory notify
zstyle :compinstall filename '/home/philipp/.zshrc'
autoload -Uz compinit && compinit

autoload -U colors && colors
PROMPT="%F{015}%K{032}[%?][%d]:%F{default}%K{default} "

# Plugins
source /usr/share/zsh-antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
# antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
# antigen bundle dirhistory
# antigen bundle jeffreytse/zsh-vi-mode
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
# Tell Antigen that you're done.
antigen apply

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="find ." # find also hidden files
# https://minsw.github.io/fzf-color-picker/
export FZF_COLORS="--color=preview-fg:#ffffff,fg:#999999,bg:#111111,hl:#ffff00 --color=fg+:#ffffff,bg+:#0087ff,hl+:#ffff00 --color=info:#ffff00,prompt:#ffffff,pointer:#ffffff --color=marker:#ffffff,spinner:#ffff00,header:#0087ff"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse $FZF_COLORS"

eval $(dircolors -b $HOME/.dircolors)

# tmux
# If not running interactively, do not do anything
# https://wiki.archlinux.org/index.php/Tmux#Start_tmux_on_every_shell_login
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# disable ctrl+r and ctrl+s key bindings
bindkey -r "^R"
bindkey -r "^S"
bindkey "^R" fzf-history-widget

# edit command with $EDITOR (default is ^x^e)
bindkey '^e' edit-command-line

unsetopt flow_control

# aliases
alias ls='ls --color=auto --group-directories-first'
alias lsa='ls -hA --color=auto --group-directories-first'
alias ll='ls -hlF --color=auto --group-directories-first'
alias lla='ls -halF --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias c='cd $(vifm --choose-dir -)'
alias D='cd $(cat $DIR_BOOKMARKS | fzf)'
alias F='$EDITOR $(cat $FILE_BOOKMARKS | fzf)'
alias L='cd $(find $LATEXDIR -mindepth 1 -maxdepth 2 -type l,d | sort | fzf)'
alias J='cd $(find $PRJDIR -mindepth 1 -maxdepth 1 -type l,d | sort | fzf)'
alias R='cd $(fzf_choose-repo.sh)'
alias e='$EDITOR'
alias k='fzf_kill.sh'
alias ka='killall'
alias xk='xkill'
alias ai='sudo apt-get install'
alias aii='fzf_apt.sh'
alias as='apt-cache search'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias rsync='rsync -v --progress'
alias df='df --human-readable'
alias md='media-download.sh'
alias dmenu='dmenu ${DMENU_OPTIONS}'
alias dict='dict.cc.py'
alias ros="source ~/oc/Linux/scripts/ros_source-ws.sh"
alias cm="catkin_make"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/philipp/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/philipp/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/philipp/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/philipp/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /opt/ros/melodic/setup.zsh
