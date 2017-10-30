#!/usr/bin/env python
# coding=utf-8

import subprocess
from pathlib import Path
from time import sleep

home = str(Path.home())
numPics = 156
interval = 0.12
picDir = home + '/bg'
picName = 'bg_'
fileType = '.png'

while True:
    for i in range(numPics):
        imgPath = str(picDir + '/' + picName) + str(i + 1) + fileType
        currentImg = subprocess.Popen(['feh', '--bg-center',
                                       '--bg-scale', imgPath])
        sleep(interval)
        currentImg.kill()
