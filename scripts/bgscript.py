#!/usr/bin/env python
# coding=utf-8

from pathlib import Path
from sh import feh

HOME     = str(Path.home())

numPics  = range(1438)
picDir   = HOME + '/bg/'
fileType = '.png'

while True: [feh("--bg-scale", picDir + str(i) + fileType) for i in numPics]
