# https://scriptingosx.com/2019/06/moving-to-zsh/
HISTFILE=/data/own/Linux/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory notify
zstyle :compinstall filename '/home/philipp/.zshrc'
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

autoload -U colors && colors
PROMPT="%F{015}%K{032}[%?][%d]:%F{default}%K{default} "

# Plugins with antibody (installation: https://getantibody.github.io)
source <(antibody init)
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-completions
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle robbyrussell/oh-my-zsh path:plugins/dirhistory
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
antibody bundle robbyrussell/oh-my-zsh path:plugins/docker

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="find ." # find also hidden files
# https://minsw.github.io/fzf-color-picker/
export FZF_COLORS="--color=preview-fg:#ffffff,fg:#999999,bg:#111111,hl:#ffff00 --color=fg+:#ffffff,bg+:#0087ff,hl+:#ffff00 --color=info:#ffff00,prompt:#ffffff,pointer:#ffffff --color=marker:#ffffff,spinner:#ffff00,header:#0087ff"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse $FZF_COLORS"

export FZF_COMPLETION_OPTS="--info=inline"

# Use fd instead of the default find command for listing path candidates
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
  cd) fzf "$@" --preview 'tree -C {} | head -200' ;;
  export | unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
  ssh) fzf "$@" --preview 'dig {}' ;;
  *) fzf "$@" ;;
  esac
}

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
autoload -U edit-command-line && zle -N edit-command-line
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
alias cm="catkin_make"