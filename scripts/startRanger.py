#!/usr/bin/env python
# coding=utf-8

import pyautogui as pag
import time


pag.keyDown('winleft')
pag.press('enter')
pag.keyUp('winleft')
time.sleep(0.5)
pag.typewrite('source ranger && clear')
pag.press('enter')
