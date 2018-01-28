#!/usr/bin/env python
# coding=utf-8

import subprocess
from pathlib import Path

home = str(Path.home())
numPics = 2878
picDir = home + '/bg'
fileType = '.png'

n = 0
while True:
    for i in range(numPics):
        n += 1
        if n != 2:
            imgPath = picDir + '/' + str(i + 1) + fileType
            p = subprocess.Popen(['feh', '--bg-center',
                                  '--bg-scale', imgPath])
            p.wait()
            p.kill()
        else:
            n = 0
