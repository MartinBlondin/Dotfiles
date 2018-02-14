from sh import nohup, ErrorReturnCode_1
from os import getcwd
from subprocess import Popen
from contextlib import suppress

with open('isSexy.tmp', 'r') as f:
    proc = f.read().split()

pid = 'DISABLED'
if pid in proc:
    pid = Popen(['nohup', 'python3', getcwd() + '/makesexy.py']).pid
else:
    with suppress(ErrorReturnCode_1):
        [nohup('kill', p) for p in proc]

with open('isSexy.tmp', 'w') as f:
    f.write(str(pid))
