#!/usr/bin/env python
# coding=utf-8

from pathlib import Path
from sh import feh, ErrorReturnCode_2
from contextlib import suppress
from time import sleep

numPics  = range(1438)
picDir   = str(Path.home()) + '/bg/'
fileType = '.png'

while True:
    for i in numPics:
        with suppress(ErrorReturnCode_2):
            feh("--bg-scale", picDir + str(i) + fileType)
        sleep(0.2)
