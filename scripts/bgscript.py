#!/usr/bin/env python
# coding=utf-8

from time import sleep
from pathlib import Path
from subprocess import call
from contextlib import suppress

numPics  = range(1438)
picDir   = str(Path.home()) + '/bg/'
fileType = '.png'

while True:
    for i in numPics:
        call(['feh', "--bg-scale", picDir + str(i) + fileType])
        sleep(0.2)
