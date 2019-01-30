#!/usr/bin/env python
# coding=utf-8

import pyautogui as pag
from time import sleep

sleep(0.5)  # wait for user to take their hands off the keyboard
pag.keyDown('winleft')
pag.press('enter')
sleep(0.1)  # make sure the terminal opens
pag.hotkey('shift', 'space')
pag.keyUp('winleft')
