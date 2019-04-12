from i3_pyautogui_bindings import  open_shell, close, set_wait_time
import pyautogui as pag
from time import sleep

'''
Changes to this file should not be commited
'''

set_wait_time('program_open', 8)  # programs open slower during start up

pag.hotkey('winleft', 'shift', 'r')
sleep(2)
open_shell(['xrandr --output HDMI-0 --mode 1920x1080 --right-of DVI-D-0 --rotate left', 'puleaudio -k'])
close()
