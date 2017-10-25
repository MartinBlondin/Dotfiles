import subprocess
from pathlib import Path

home = Path.home
home = str(Path.home()) + '/'

repoDir = 'dotfiles/'


def link(source, dest):
    subprocess.call(['ln', '-s', home + repoDir + source, home + dest])


# i3
link('i3wm/bgscript.py', 'bgscript.py')
link('i3wm/starti3.py', 'starti3.py')
link('i3wm/makesexy.py', 'makesexy.py')
link('i3wm/bgscript.py', 'bgscript.py')
link('i3wm/i3pystatus.py', 'i3pystatus.py')

link('i3wm/.i3rc', '.config/i3/config')
link('i3wm/compton.conf', '.config/compton.conf')

link('bg', 'bg')

# emacs
link('emacs/.emacs', '.emacs')
link('emacs/.emacs', '.emacs')

# qutebrowser
link('qutebrowser', 'qutebrowser')

# vim
link('vim/.vimrc', '.vimrc')
link('vim/.nvimrc', '.nvimrc')
