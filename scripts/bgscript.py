#!/usr/bin/env python
# coding=utf-8

from time import sleep
from pathlib import Path
from subprocess import call

numPics  = range(1438)
picDir   = str(Path.home()) + '/bg/'
fileType = '.png'

while True:
    for i in numPics:
        call(['feh', '--bg-scale', f'{picDir}{i}{fileType}'])
        sleep(0.3)
