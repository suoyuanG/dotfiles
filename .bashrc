#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTSIZE=6

alias ls='/usr/bin/lsd'
alias find='/usr/bin/fd'
alias grep='/usr/bin/rg'

eval "$(starship init bash)"

alias ll='ls -l'
