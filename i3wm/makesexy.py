import subprocess
from pathlib import Path
import threading
import random
import time

def killIfOpen(greparg):
    ps = subprocess.Popen(('ps', '-ax'), stdout=subprocess.PIPE)
    pid = subprocess.check_output(('grep', greparg), stdin=ps.stdout)
    pid = str(pid).split("\\n")
    pid = [i for i in pid if "grep" not in i]
    if not len(pid) > 1:
        print(greparg + " not running")
        return
    if pid[0][0] == 'b':
        pid = pid[0][2:]
    else:
        pid = pid[0]
    pid = pid.split(' ')[0]
    ps.wait()
    print(pid)
    kp = subprocess.Popen(('kill', pid))
    kp.wait()


# killIfOpen('compton')
# killIfOpen('bgscr')

home = str(Path.home()) + '/'


def startBgscript():
    bgscript = subprocess.call(['python', home + 'bgscript.py'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    bgscript.wait()


def startCompton():
    compton = subprocess.call(['compton', '-f', '--config', home + '.config/compton.conf'], stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    compton.wait()


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
