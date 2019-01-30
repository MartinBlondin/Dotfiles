#!/usr/bin/env python
# coding=utf-8

import pyautogui as pag
from time import sleep

WAIT_FOR_PROGRAM_OPEN_TIME = 0.3

def open_shell(command=False):
    pag.hotkey('winleft', 'enter')
    if command:
        sleep(WAIT_FOR_PROGRAM_OPEN_TIME)
        if isinstance(command, list):
            for c in command:
                pag.typewrite(command)
                pag.press('enter')
                sleep(0.1)
        else:
            pag.typewrite(command)
            pag.press('enter')
    sleep(WAIT_FOR_PROGRAM_OPEN_TIME)

def open_program(name):
    pag.hotkey('winleft', 'd')
    sleep(WAIT_FOR_PROGRAM_OPEN_TIME)
    pag.typewrite(name)
    pag.press('enter')
    sleep(WAIT_FOR_PROGRAM_OPEN_TIME)

def set_vertical():
    pag.hotkey('winleft', 'v')

def set_horizontal():
    pag.hotkey('winleft', 'g')

def resize(n, dir):
    pag.hotkey('winleft', 'r')
    for i in range(n):
        pag.press(dir)
    pag.press('escape')

def goto_workspace(workspaceId):
    pag.hotkey('winleft', str(workspaceId))

def send_to_workspace(workspaceId):
    pag.hotkey('winleft', 'shift', str(workspaceId))

def close():
    pag.hotkey('winleft', 'q')

def focus(dir):
    pag.hotkey('winleft', dir)


if __name__ == '__main__':
    WAIT_FOR_PROGRAM_OPEN_TIME = 1  # bigger because script runs at startup
    open_program('qutebrowser')

    goto_workspace(1)
    open_shell('glances', 10)
    set_vertical()
    open_shell()
    resize(1, 'k')
    set_horizontal()
    open_shell('archey3')
    focus('h')
    set_vertical()
    open_shell()
    pag.typewrite('xrandr --output HDMI-0 --mode 1920x1080 --right-of DVI-D-0 --rotate left')
    open_shell('xrandr --output DVI-D-0 --mode 1920x1080 --rate 144')
    close()
    open_shell('setxkbmap -option caps:escape')
    close()

    goto_workspace(4)
    set_vertical()
    open_shell('clear && cowsay -f tux -p "Dont be a dick." | lolcat')
    pag.typewrite('hhpc -i 4')
    pag.press('enter')
    set_horizontal()
    open_shell(['transmission-daemon', 'transmission-remote-cli'])
    pag.hotkey('winleft', 'shift', 'l')
    resize(3, 'l')
    set_vertical()
    open_shell('syncthing --no-browser')
    resize(3, 'k')
    focus('k')

    goto_workspace(2)
    open_shell()

    goto_workspace(3)
    open_program('emacs')
    open_shell('sleep 40 && exit')

    goto_workspace(5)
    open_shell('ranger')
    pag.hotkey('winleft', 'w')

    goto_workspace(2)
    pag.hotkey('winleft', 'q')
