# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h] [\w]\n\$ '
export visual='emacsclient'
export EDITOR='vim'
export LD_LIBRARY_PATH='/lib/openssl-1.0'

# archey3
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144
setxkbmap -option caps:escape

alias nvim="nvim -u ~/.nvimrc"
porn="/run/media/martin/PornBank"

alias gotoporn="cd $porn"

setxkbmap -layout us
alias nolay="setxkbmap -layout no"
alias keylayout="evince /run/media/martin/PornBank/ergodox/layout.pdf"

alias q="exit"
alias r="ranger"
alias v="vim"
alias y="youtube-dl"
