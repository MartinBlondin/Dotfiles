#!/usr/bin/env python
# coding=utf-8

from os import path
import pyautogui as pag
from subprocess import call
from i3_pyautogui_bindings import (open_program, open_shell, set_vertical,  set_horizontal,
                                   goto_workspace, close, focus, resize, set_wait_time)


if path.isfile('local_commands_before_startup.py'):
    call(['python3', 'local_commands_before_startup.py'])

set_wait_time('program_open', 1)  # programs open slower during start up

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
open_shell()
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

if path.isfile('local_commands_after_startup.py'):
    call(['python3', 'local_commands_after_startup.py'])
