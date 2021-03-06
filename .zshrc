# Created by newuser for 5.0.5
export LANG=ja_JP.UTF-8

# Color
export LSCOLORS=Exfxcxdxbxegedabagacad
export ZLS_COLORS=$LS_COLORS
export CLICOLOR=true

# Prompt
PROMPT='%(?,%F{green},%F{red})[%n@%m %~]%#%f '

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

autoload -U compinit vcs_info
compinit -u

alias vi=vim
alias ll="ls -l"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias j="jobs"
alias f="fg"
alias .="source"
alias history="history -i 1"
alias gti="git"

DIRSTACKSIZE=100

# PROMPT

# RPROMT
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '[%b]%u%c'
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '-'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT='%1(v|%F{yellow}%1v%f|)'

setopt auto_menu
setopt auto_cd
setopt no_beep
setopt auto_pushd
setopt multios
setopt print_eight_bit
setopt extended_history
setopt hist_reduce_blanks
setopt correct
setopt extended_history
setopt append_history
setopt inc_append_history
setopt hist_save_no_dups
setopt hist_no_functions
setopt hist_no_store
setopt hist_ignore_dups

export PATH=$HOME/.nodebrew/current/bin:$PATH

export PATH="$HOME/.rbenv/bin:$PATH"
export RBENV_ROOT=$HOME/.rbenv
eval "$(rbenv init -)"

if [ -z $TMUX ]; then
  if $(tmux has-session 2> /dev/null); then
    tmux -2 attach
  else
    tmux -2
  fi
fi
