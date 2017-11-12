from time import sleep
from subprocess import run

nonet = True
while nonet:
    run(['ping', 'archlinux.com'])
    sleep(5)
