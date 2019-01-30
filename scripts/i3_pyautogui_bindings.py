#!/usr/bin/env python
# coding=utf-8

import pyautogui as pag
from time import sleep

WAIT_FOR_PROGRAM_OPEN_TIME = 0.3

def set_wait_time(delay):
    WAIT_FOR_PROGRAM_OPEN_TIME = delay

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
