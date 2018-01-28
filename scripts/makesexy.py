#!/usr/bin/env python
# coding=utf-8

import subprocess
from pathlib import Path
import threading

home = str(Path.home()) + '/'


def startBgscript():
    bgscript = subprocess.call(['python3', home + 'bgscript.py'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)


def startCompton():
    compton = subprocess.call(['compton', '-f', '-c', '-o', '0.6', '--inactive-dim', '0.1', '--config', home + '.config/compton.conf'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)

thread_1 = threading.Thread(target=startCompton, args=())
thread_2 = threading.Thread(target=startBgscript, args=())

# making a thread a `daemon` means that when the main process
# ends the thread will end too
thread_1.daemon = True
thread_2.daemon = True

# start the threads running
thread_1.start()
thread_2.start()

# wait for all the child threads to terminate before ending
thread_1.join()
thread_2.join()
