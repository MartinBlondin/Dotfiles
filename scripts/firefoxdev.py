import pyautogui as pag
from time import sleep


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


openFirefox()
pag.keyDown('winleft')
pag.press('l')
pag.press('space')
pag.press('h')
pag.keyUp('winleft')
