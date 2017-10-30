#!/usr/bin/env python
# coding=utf-8

import subprocess as s

ps = s.Popen(['setxkbmap', '-query'], stdout=s.PIPE)
layout = str(s.check_output(('grep', 'layout'), stdin=ps.stdout))[-5:-3]

if layout == 'us': s.run(['setxkbmap', '-layout', 'no'])
elif layout == 'no': s.run(['setxkbmap', '-layout', 'us'])
