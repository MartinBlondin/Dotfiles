#!/usr/bin/env python
# coding=utf-8

from os import path
import pyautogui as pag
from subprocess import call
from time import sleep
from i3_pyautogui_bindings import (open_program, open_shell, set_vertical,  set_horizontal,
                                   goto_workspace, close, focus, resize, set_wait_time, run_command)


set_wait_time('program_open', 2)  # programs open slower during start up
run_command('setxkbmap -layout us')

goto_workspace(1)

if path.isfile('local_commands_before_startup.py'): call(['python3', 'local_commands_before_startup.py'])

open_shell('glances')
set_vertical()
open_shell()
resize(1, 'k')
set_horizontal()
open_shell('archey3')
focus('h')
set_vertical()
open_shell()

goto_workspace(4)
set_vertical()
open_shell(['clear && cowsay -f tux -p "Dont be a dick." | lolcat', 'hhpc -i 4'])
set_horizontal()
open_shell(['transmission-daemon', 'transmission-remote-cli'])
pag.hotkey('winleft', 'shift', 'l')
resize(3, 'l')

goto_workspace(2)
open_shell()
open_program('qutebrowser')

goto_workspace(3)
open_program('emacs')

goto_workspace(5)
open_shell('r')
pag.hotkey('winleft', 'w')

goto_workspace(2)
close()

open_program('ardour')

if path.isfile('local_commands_after_startup.py'): call(['python3', 'local_commands_after_startup.py'])
