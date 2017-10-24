import pyautogui as pag
import time

time.sleep(0.5)  # wait for user to take his hands off the keyboard
pag.keyDown('winleft')
pag.press('enter')
pag.keyDown('shift')
pag.press('space')
pag.keyUp('shift')
pag.keyUp('winleft')
