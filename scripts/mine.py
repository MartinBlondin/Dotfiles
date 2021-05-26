from subprocess import call
from time import sleep

worker = input('Worker name: ')

while True:
    call(['ethminer', '-P', f'stratum1+tcp://0x3cB225F235fBc43c8fc8e337CCe2F03E784c2192.{worker}@eu1.ethermine.org:4444', '-U', '-R'])
    sleep(30)
