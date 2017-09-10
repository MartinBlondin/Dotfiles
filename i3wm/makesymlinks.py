import subprocess
from pathlib import Path

home = Path.home
home = str(Path.home()) + '/'


def link(file):
    subprocess.call(['ln', '-s', home + 'dotfiles/i3wm/' + file, home + file])


link('bgscript.py')
link('starti3.py')
link('makesexy.py')

subprocess.call(['ln', '-s', home + 'dotfiles/i3wm/.i3rc', home + 'config/i3/config'])

subprocess.call(['mkdir', home + 'bg'])
subprocess.call(['cp', home + 'dotfiles/bg/*', home + 'bg/'])
