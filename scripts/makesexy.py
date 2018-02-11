#!/usr/bin/env python
# coding=utf-8

import subprocess
from pathlib import Path
import threading

home = str(Path.home()) + '/'
bgscript = None
compton = None


def startBgscript():
    bgscript = subprocess.Popen(['python3', home + 'bgscript.py'])
    pid = bgscript.pid
    with open('isSexy.tmp', 'a') as f:
        f.write('\n' + str(pid))
    bgscript.wait()


def startCompton():
    compton = subprocess.Popen(['compton', '-f', '-c', '-C', '-z', '-G',
                                '-o', '2', '--inactive-dim', '0.1',
                                '--config', home + '.config/compton.conf'])
    pid = compton.pid
    with open('isSexy.tmp', 'a') as f:
        f.write('\n' + str(pid))
    compton.wait()


def start():
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


if __name__ == '__main__':
    start()
