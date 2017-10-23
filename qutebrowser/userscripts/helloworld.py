#!/usr/bin/env python
# coding=utf-8

# python examples/my_hello.py --install --bin=myhello

from qutescript import userscript


@userscript
def hello_world(request):
    request.send_text(str(request))


if __name__ == '__main__':
    hello_world()
