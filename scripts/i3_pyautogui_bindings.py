#!/usr/bin/env python
# coding=utf-8

from time import sleep
import pyautogui as pag
import i3

'''
Various python bindings to interact with I3WM

not using pag.hotkey because it has a 50% chance to not work
'''

delays = {'program_open': 0.3}

def set_wait_time(key, delay):
    delays[key] = delay

def run_command(command):
    i3.exec(command)

def open_shell(command=False):
    run_command('termite')
    if command:
        sleep(delays['program_open'])
        if isinstance(command, list):
            for c in command:
                pag.typewrite(c)
                pag.press('enter')
                sleep(0.1)
        else:
            pag.typewrite(command)
            pag.press('enter')

def open_program(name):
    print('opening ', name)
    run_command(name)
    sleep(delays['program_open'])

def set_vertical():
    pag.keyDown('winleft')
    pag.press('v')
    pag.keyUp('winleft')

def set_horizontal():
    pag.keyDown('winleft')
    pag.press('g')
    pag.keyUp('winleft')

def resize(n, dir):
    pag.keyDown('winleft')
    pag.press('r')
    pag.keyUp('winleft')
    for i in range(n):
        pag.press(dir)
    pag.press('escape')

def move(dir):
    pag.keyDown('winleft')
    pag.keyDown('shift')
    pag.press(dir)
    pag.keyUp('shift')
    pag.keyUp('winleft')

def goto_workspace(workspaceId):
    pag.keyDown('winleft')
    pag.press(str(workspaceId))
    pag.keyUp('winleft')

def send_to_workspace(workspaceId):
    pag.keyDown('winleft')
    pag.keyDown('shift')
    pag.press(str(workspaceId))
    pag.keyUp('shift')
    pag.keyUp('winleft')

def close():
    pag.keyDown('winleft')
    pag.press('q')
    pag.keyUp('winleft')

def focus(dir):
    pag.keyDown('winleft')
    pag.press(dir)
    pag.keyUp('winleft')

def toggle_floating():
    pag.keyDown('winleft')
    pag.keyDown('shift')
    pag.press('space')
    pag.keyUp('shift')
    pag.keyUp('winleft')
