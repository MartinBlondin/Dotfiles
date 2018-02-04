# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h] [\w]\n\$ '
export visual='emacsclient'
export EDITOR='vim'

function bot-emulator {
    wd=$PWD
    cd /home/martin/BotFramework-Emulator
    npm run start
    cd $wd
}

# archey3
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144
setxkbmap -option caps:escape

alias nvim="nvim -u ~/.nvimrc"
porn="/run/media/martin/PornBank"

alias gotoporn="cd $porn"

setxkbmap -layout us
alias nolay="setxkbmap -layout no"
alias keylayout="evince /run/media/martin/PornBank/ergodox/layout.pdf"

alias r="ranger"
alias v="vim"
