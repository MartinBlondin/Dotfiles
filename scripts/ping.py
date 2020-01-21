from time import sleep
from subprocess import run

nonet = True
while nonet:
    run(['ping', '8.8.8.8'])
    sleep(5)
