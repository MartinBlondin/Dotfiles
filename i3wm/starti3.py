import pyautogui as pag
import time


def openShell():
    pag.keyDown('winleft')
    pag.press('enter')
    pag.keyUp('winleft')
    return()


def setVertical():
    pag.keyDown('winleft')
    pag.press('v')
    pag.keyUp('winleft')
    return()


def setHorizontal():
    pag.keyDown('winleft')
    pag.press('g')
    pag.keyUp('winleft')
    return()


def openEmacs():
    pag.keyDown('winleft')
    pag.press('z')
    pag.keyUp('winleft')
    return()


def openFirefox():
    pag.keyDown('winleft')
    pag.press('p')
    pag.keyUp('winleft')
    return()


def openSyncthing():
    pag.keyDown('winleft')
    pag.press('enter')
    pag.keyUp('winleft')
    time.sleep(1)
    pag.typewrite('syncthing -no-browser')
    pag.press('enter')
    return()


def openMakesexy():
    pag.keyDown('winleft')
    pag.press('enter')
    pag.keyUp('winleft')
    pag.typewrite('python3 makesexy.py')
    pag.press('enter')
    return()


def gotoWorkspace(workspaceId):
    pag.keyDown('winleft')
    pag.press(str(workspaceId))
    pag.keyUp('winleft')
    return()


def sendtoWorkspace(workspaceId):
    pag.keyDown('winleft')
    pag.keyDown('shift')
    pag.press(str(workspaceId))
    pag.keyUp('shift')
    pag.keyUp('winleft')
    return()


time.sleep(2)
gotoWorkspace(1)
openShell()
setVertical()
openShell()
setHorizontal()
openShell()
setVertical()
openShell()

gotoWorkspace(4)
openSyncthing()
setVertical()
openMakesexy()

gotoWorkspace(2)
openFirefox()

gotoWorkspace(3)
openEmacs()

time.sleep(2)

gotoWorkspace(3)
sendtoWorkspace(9)
gotoWorkspace(9)
sendtoWorkspace(3)
gotoWorkspace(2)
