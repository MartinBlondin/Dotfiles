#!/usr/bin/env python
# coding=utf-8

import pyautogui as pag
import time

time.sleep(0.5)  # wait for user to take his hands off the keyboard
pag.keyDown('winleft')
pag.press('enter')
pag.keyDown('shift')
time.sleep(0.1)  # make sure the terminal opens
pag.press('space')
pag.keyUp('shift')
pag.keyUp('winleft')
