#!/usr/bin/env python
# coding=utf-8

from pathlib import Path
from sh import feh
from time import sleep

numPics  = range(1438)
picDir   = str(Path.home()) + '/bg/'
fileType = '.png'

while True:
    for i in numPics:
        feh("--bg-center", picDir + str(i) + fileType)
        sleep(0.2)
