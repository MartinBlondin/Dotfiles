import pyautogui as pag
from i3_pyautogui_bindings import  open_shell, set_wait_time

'''
Changes to this file should not be commited
'''

set_wait_time('program_open', 1)  # programs open slower during start up

open_shell('xrandr --output DVI-D-0 --mode 1920x1080 --rate 144')
pag.typewrite('xrandr --output HDMI-0 --mode 1920x1080 --right-of DVI-D-0 --rotate left')
