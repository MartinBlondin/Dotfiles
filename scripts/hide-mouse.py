#!/usr/bin/env python
# coding=utf-8

import pyautogui as pag

width = pag.size()[0]
height = pag.size()[1]

print(pag.size())
if pag.position()[0] == width - 1:
    pag.moveTo(width / 2, height / 2)
else:
    pag.moveTo(width, height)
