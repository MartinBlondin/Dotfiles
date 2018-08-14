#!/usr/bin/env python
# coding=utf-8

import pyautogui as pag
import time


def openShell(command=False, commandWaitTime=1):
    pag.keyDown('winleft')
    pag.press('enter')
    pag.keyUp('winleft')
    if command:
        time.sleep(commandWaitTime)
        pag.typewrite(command)
        pag.press('enter')
    time.sleep(1)


def openProgram(name):
    pag.hotkey('winleft', 'd')
    pag.typewrite(name)
    pag.press('enter')


def setVertical():
    pag.keyDown('winleft')
    pag.press('v')
    pag.keyUp('winleft')


def setHorizontal():
    pag.keyDown('winleft')
    pag.press('g')
    pag.keyUp('winleft')


def openEmacs():
    pag.keyDown('winleft')
    pag.press('z')
    pag.keyUp('winleft')


def openRanger():
    pag.keyDown('winleft')
    pag.press('c')
    pag.keyUp('winleft')


def openQutebrowser():
    pag.keyDown('winleft')
    pag.press('t')
    pag.keyUp('winleft')


def openTransmission():
    setHorizontal()
    openShell()
    pag.keyDown('winleft')
    pag.keyDown('shift')
    pag.press('l')
    pag.keyUp('shift')
    pag.keyUp('winleft')

    pag.typewrite('transmission-daemon')
    pag.press('enter')
    time.sleep(1)
    pag.typewrite('transmission-remote-cli')
    pag.press('enter')
    time.sleep(1)


def resize(n, dir):
    pag.keyDown('winleft')
    pag.press('r')
    pag.keyUp('winleft')
    for i in range(n):
        pag.press(dir)
    pag.press('escape')


def gotoWorkspace(workspaceId):
    pag.keyDown('winleft')
    pag.press(str(workspaceId))
    pag.keyUp('winleft')


def sendtoWorkspace(workspaceId):
    pag.keyDown('winleft')
    pag.keyDown('shift')
    pag.press(str(workspaceId))
    pag.keyUp('shift')
    pag.keyUp('winleft')


def close():
    pag.keyDown('winleft')
    pag.press('q')
    pag.keyUp('winleft')


def hidemouse():
    pag.keyDown('winleft')
    pag.press('escape')
    pag.keyUp('winleft')


def focus(dir):
    pag.keyDown('winleft')
    pag.press(dir)
    pag.keyUp('winleft')


hidemouse()

openQutebrowser()

gotoWorkspace(1)
openShell('glances', 10)
setVertical()
openShell()
resize(1, 'k')
setHorizontal()
openShell('archey3')
focus('h')
setVertical()
openShell()

gotoWorkspace(4)
setVertical()
openShell('clear && cowsay windows sucks')
openTransmission()
resize(3, 'l')
setVertical()
openShell('syncthing --no-browser')
resize(3, 'k')
focus('k')

gotoWorkspace(2)
openShell()

gotoWorkspace(3)
openEmacs()
openShell('sleep 40 && exit')

gotoWorkspace(5)
openRanger()
pag.hotkey('winleft', 'w')

gotoWorkspace(2)
pag.hotkey('winleft', 'q')
