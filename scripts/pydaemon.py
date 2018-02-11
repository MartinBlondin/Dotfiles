from sh import nohup
from os import getcwd
from subprocess import Popen

with open('isSexy.tmp', 'r') as f:
    proc = f.read().split()

pid = 'DISABLED'
if pid in proc:
    pid = Popen(['nohup', 'python3', getcwd() + '/makesexy.py']).pid
else:
    for p in proc:
        nohup('kill', p)

with open('isSexy.tmp', 'w') as f:
    f.write(str(pid))
