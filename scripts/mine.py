from subprocess import call
from time import sleep

worker = input('Worker name: ')

while True:
    call(['ethminer', '-P', f'stratum1+tcp://0x9c18e6655Ff76cf7ed5bc49A919b754AEa93ad64.{worker}@eu1.ethermine.org:4444', '-G', '-R'])
    sleep(30)
