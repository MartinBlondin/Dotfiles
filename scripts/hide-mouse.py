#!/usr/bin/env python
# coding=utf-8

import pyautogui as pag
from time import sleep

width  = pag.size()[0] - 1
height = pag.size()[1]

if pag.position()[0] == width:
    pag.moveTo((width / 2) - 1, (height / 2) - 1)
    sleep(0.01)
    pag.moveTo(width / 2, height / 2)
else:
    pag.moveTo(width, height)
