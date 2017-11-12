import pyautogui as pag
from time import sleep

pag.keyDown('winleft')


def openTerminal():
    pag.keyDown('winleft')
    pag.press('return')
    pag.keyDown('shift')
    for i in range(5):
        pag.press('l')
    pag.keyUp('shift')
    pag.keyUp('winleft')


def openFirefox():
    pag.keyDown('winleft')
    pag.press('d')
    pag.keyUp('winleft')
    pag.typewrite('firefox')
    pag.press('return')
    sleep(2)

    pag.keyDown('winleft')
    pag.keyDown('shift')
    pag.press('space')
    pag.keyUp('winleft')
    pag.keyUp('shift')


openTerminal()
openQutebrowser()
openFirefox()
pag.keyDown('winleft')
pag.press('l')
pag.press('space')
pag.press('h')
pag.keyUp('winleft')
