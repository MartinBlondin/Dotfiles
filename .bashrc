# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto --group-directories-first'
PS1='[\u@\h] [\w]\n\$ '
export visual='emacsclient'
export EDITOR='vim'
export LD_LIBRARY_PATH='/lib/openssl-1.0'

# archey3
alias nvim="nvim -u ~/.nvimrc"
porn="/run/media/martin/PornBank"

alias gotoporn="cd $porn"

setxkbmap -layout us
alias nolay="setxkbmap -layout no"
alias keylayout="evince /run/media/martin/PornBank/ergodox/layout.pdf"

alias s="sudo"
alias p="sudo pacman"
alias q="exit"
alias r="source ranger"
alias v="vim"
alias y="youtube-dl"

alias update="sudo pacman -Syu --noconfirm"
alias please="sudo"

#TODO: make a python program that wraps rm and warns you
#      if you try to call rm *, rm /, or rm .
# alias rm="pyrm.py"
