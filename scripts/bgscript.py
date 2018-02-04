#!/usr/bin/env python
# coding=utf-8

from pathlib import Path
from sh import feh

home = str(Path.home())
numPics = 1438
picDir = home + '/bg/'
fileType = '.png'

while True:
    for i in range(numPics):
        imgPath = picDir + str(i) + fileType
        feh("--bg-center", imgPath)
