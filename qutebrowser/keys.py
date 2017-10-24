def bind(config):
    config.unbind('J', mode='normal')
    config.unbind('K', mode='normal')
    config.unbind('d', mode='normal')
    config.unbind('th', mode='normal')
    config.unbind('tl', mode='normal')
    config.unbind('?', mode='normal')
    config.unbind(';t', mode='normal')
    config.unbind(';t', mode='normal')

    config.bind('<Shift-i>', 'config-source')
    config.bind('x', 'tab-close')
    config.bind('J', 'tab-prev')
    config.bind('K', 'tab-next')
    config.bind('gh', 'back -t')
    config.bind('gl', 'forward -t')
    config.bind('t', 'tab-clone')
    config.bind('?', 'open -t qute://help/img/cheatsheet-big.png')

    navbind('y', 'youtube.com', config)
    navbind('r', 'reddit.com', config)
    navbind('m', 'protonmail.com/login', config)
    navbind('g', 'gmail.com', config)
    navbind('f', 'facebook.com', config)
    navbind('s', 'soundcloud.com', config)

    config.bind(',s', 'open -t qute://settings')
    config.bind(',t', 'hint links spawn transmission-remote -a {hint-url}')
    config.bind(',d', 'spawn youtube-dl -o "~/Downloads/%(title)s.%(ext)s" {url}')
    config.bind(',m', 'spawn youtube-dl -o "~/Downloads/%(title)s.%(ext)s" -x --audio-format vorbis --audio-quality 0 {url}')

def navbind(bind, link, config):
    config.bind('d' + bind, 'open ' + link)
    config.bind('d' + bind.upper(), 'open -t ' + link)
