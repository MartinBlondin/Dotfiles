# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()
# -*- mode: python -*-

from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer
from javascript_whitelist import javascript_whitelist
from user_agents import user_agents
import random

# privacy
invidious_mirrors = ['vid.puffyan.us', #'invidious.snopyta.org', # 'invidious.exonip.de', # 'inv.skyn3t.in',
]
def getInvidious(): return invidious_mirrors[random.randint(0, len(invidious_mirrors)-1)]
def randomize_user_agent(c): return c.format(rua='spawn --userscript randomize_user_agent.py -c')
c.content.headers.user_agent = user_agents[random.randint(0, len(user_agents)-1)]
c.content.headers.accept_language ='en-US,en;q=0.5'
c.content.headers.custom = {"accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"}
c.content.canvas_reading = False
c.content.webgl = False
c.content.webrtc_ip_handling_policy = 'disable-non-proxied-udp'
c.content.proxy = 'system'
c.content.javascript.enabled = False

javascript_whitelist.extend(invidious_mirrors)
for url in javascript_whitelist: config.set('content.javascript.enabled', True, url)


config = config  # type: ConfigAPI
c = c  # type: ConfigContainer
config.load_autoconfig(True)

# ui
c.completion.scrollbar.width = 0
c.tabs.position = 'top'
c.tabs.show = 'always'
c.tabs.favicons.show = 'always'
c.tabs.indicator.width = 0
c.tabs.title.format = '{current_title}'
c.tabs.title.alignment = 'center'
c.downloads.position = 'bottom'
c.scrolling.smooth = True
# c.colors.webpage.bg = '#AA1c2028'
# c.colors.webpage.bg = '#00000000'
c.colors.webpage.bg = '#272b33'
c.completion.height = '20%'
c.statusbar.show = 'never'
c.hints.uppercase = True
c.downloads.remove_finished = 1
c.content.user_stylesheets = ['onedark-all-sites.css']
c.content.pdfjs = True
# c.hints.chars = 'asdfjkl;'
c.hints.chars = 'asdfjkl'
c.colors.webpage.preferred_color_scheme = 'dark'

# behavior
c.bindings.key_mappings = {"<Ctrl-[>": "<Escape>", "<Ctrl-6>": "<Ctrl-^>",
                           "<Ctrl-M>": "<Return>", "<Shift-Return>": "<Return>",
                           "<Enter>": "<Return>", "<Shift-Enter>": "<Return>",
                           "<Ctrl-Enter>": "<Ctrl-Return>"}
c.downloads.location.prompt = False
c.downloads.location.directory = '~/Downloads/'
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}',
                       # 'y': 'https://youtube.com/results?search_query={}',
                       'y': getInvidious()+'/search?q={}',
                       'r': 'https://reddit.com/r/{}',
                       'w': 'https://en.wikipedia.org/w/index.php?search={}',
                       'rp': 'https://redditp.com/r/{}',
                       'rt': 'https://www.rottentomatoes.com/search/?search={}',
                       'ra': 'https://proxyrarbg.org/torrents.php?search={}&category%5B%5D=14&category%5B%5D=48&category%5B%5D=17&category%5B%5D=44&category%5B%5D=45&category%5B%5D=47&category%5B%5D=50&category%5B%5D=51&category%5B%5D=52&category%5B%5D=42&category%5B%5D=46&category%5B%5D=18&category%5B%5D=41&category%5B%5D=49&category%5B%5D=23&category%5B%5D=25&category%5B%5D=27&category%5B%5D=28&category%5B%5D=40&category%5B%5D=32&category%5B%5D=33',
                       'sound': 'https://soundcloud.com/search?q={}',
                       'i': 'http://www.imdb.com/find?ref_=nv_sr_fn&q=+{}&s=all',
                       'a': 'https://wiki.archlinux.org/index.php?search={}',
                       'am': 'https://www.amazon.co.uk/s/ref=nb_sb_noss_2?url=search-alias%3Daps&field-keywords={}',
                       'e': 'https://www.ebay.com/sch/i.html?_from=R40&_nkw={}&_sacat=0',
                       'pj': 'https://www.prisjakt.no/raw.php?query={}',
                       'pt': 'https://peer.tube/search?search={}',
                       'g': 'https://github.com/search?utf8=%E2%9C%93&q={}&type=',
                       'l': 'http://gen.lib.rus.ec/search.php?req={}&open=0&res=25&view=simple&phrase=1&column=title',
                       'p': 'https://www.protondb.com/search?q={}',
                       'z': 'https://www.zalando.no/dame/?q={}',
                       'm': 'https://www.med24.no/soek?query={}',
                       'b': 'https://www.blush.no/search?q={}',
                       'vcv': 'https://vcvrack.com/plugins#{}',
                       's': 'https://sortere.no/privat/sok/{}',
                       'd': 'https://www.digikey.no/products/en?keywords={}'
}
c.input.insert_mode.auto_load = False
c.input.insert_mode.auto_leave = False
c.tabs.background = True
c.editor.command = ['emacsclient', '-c', '{}']
c.auto_save.session = True

theme = {
    'panel': {
        'height': 28,
    },

    'fonts': {
        'main': '12pt Roboto Slab Mono',
        'status': '10pt Roboto Slab Mono',
        'entry': '11pt Roboto Slab Mono',
        'tab_bold': True,
        'tab_size': 12,
    },

    'colors': {
        'bg': {
            'normal': '#272b33',
            'active': '#272b33',
            'inactive': '#272b33',
        },

        'fg': {
            'normal': '#f3f4f5',
            'active': '#896cad',
            'inactive': '#878E7D',

            # completion and hints
            'match': '#2f343f',
        },
    }
}

# colors
colors = theme['colors']


def setToBG(colortype, target):
    config.set('colors.' + target, colors['bg'][colortype])


def setToFG(colortype, target):
    config.set('colors.' + target, colors['fg'][colortype])


def colorSync(colortype, setting):
    if setting.endswith('.fg'):
        setToFG(colortype, setting)
    elif setting.endswith('.bg'):
        setToBG(colortype, setting)
    elif setting.endswith('.top') or setting.endswith('.bottom'):
        setToFG(colortype, setting)
    else:
        setToFG(colortype, setting + '.fg')
        setToBG(colortype, setting + '.bg')


targets = {
    'normal': [
        'tabs.even',
        'tabs.odd',
        'hints',
        'downloads.bar.bg',
        ],

    'active': [
        'statusbar.normal',
        'statusbar.command',
        'tabs.selected.even',
        'tabs.selected.odd',
        'statusbar.insert',
        'downloads.stop',
        'prompts',
        'messages.warning',
        'messages.error',

        'completion.item.selected',

        'statusbar.url.success.http.fg',
        'statusbar.url.success.https.fg',

        'completion.category',
    ],

    'inactive': [
        'tabs.even',
        'tabs.odd',
        'completion.scrollbar',
        'downloads.start',
        'messages.info',
        'completion.fg',
        'completion.odd.bg',
        'completion.even.bg',

        'completion.category.border.top',
        'completion.category.border.bottom',
        'completion.item.selected.border.top',
        'completion.item.selected.border.bottom',
    ],

    'match': [
        'completion.match.fg',
        'hints.match.fg',
    ]
}

for colortype in targets:
    for target in targets[colortype]:
        colorSync(colortype, target)

setToFG('active', 'statusbar.progress.bg')

config.set('hints.border', '1px solid ' + colors['fg']['normal'])


# tabbar
def makePadding(top, bottom, left, right):
    return {'top': top, 'bottom': bottom, 'left': left, 'right': right}

surround = round((theme['panel']['height'] - 14) / 2)
c.tabs.padding = makePadding(surround, surround, 4, 4)
c.tabs.indicator.padding = makePadding(0, 0, 0, 0)

# fonts
c.fonts.default_family = theme['fonts']['main'].split(' ')
c.fonts.completion.entry = theme['fonts']['status']
c.fonts.completion.category = theme['fonts']['status']
c.fonts.debug_console = theme['fonts']['main']
c.fonts.downloads = theme['fonts']['main']
c.fonts.hints = theme['fonts']['status']
c.fonts.keyhint = theme['fonts']['main']
c.fonts.messages.error = theme['fonts']['main']
c.fonts.messages.info = theme['fonts']['main']
c.fonts.messages.warning = theme['fonts']['main']
c.fonts.prompts = theme['fonts']['main']
c.fonts.statusbar = theme['fonts']['entry']

tabFont = str(theme['fonts']['tab_size']) + 'pt ' + theme['fonts']['main']
if theme['fonts']['tab_bold']:
    tabFont = 'bold ' + tabFont
c.fonts.tabs.selected = tabFont
c.fonts.tabs.unselected = tabFont

def bind():
    def navbind(bind, link):
        config.bind('d' + bind,         randomize_user_agent('{rua} \'open ' + link + '\''))
        config.bind('d' + bind.upper(), randomize_user_agent('{rua} \'open -t ' + link + '\''))

    config.unbind('J',  mode='normal')
    config.unbind('K',  mode='normal')
    config.unbind('H',  mode='normal')
    config.unbind('L',  mode='normal')
    config.unbind('d',  mode='normal')
    config.unbind('th', mode='normal')
    config.unbind('tl', mode='normal')
    config.unbind('?',  mode='normal')
    config.unbind(';t', mode='normal')
    config.unbind(';t', mode='normal')

    config.bind('I', 'config-source')
    config.bind('x', 'tab-close')
    config.bind('J', 'tab-prev')
    config.bind('K', 'tab-next')
    config.bind('h', 'back')
    config.bind('l', 'forward')
    config.bind('H', 'back -t')
    config.bind('L', 'forward -t')
    config.bind('?', 'open -t qute://help/img/cheatsheet-big.png')
    config.bind('f', randomize_user_agent('hint links {rua} \'open ') + '{hint-url}\'')
    config.bind('F', randomize_user_agent('hint links {rua} \'open -t ') + '{hint-url}\'')

    config.bind('<Ctrl-J>', 'scroll-page 0 0.5')
    config.bind('<Ctrl-K>', 'scroll-page 0 -0.5')

    # navbind('y', 'https://youtube.com')
    navbind('y', getInvidious()+'/feed/subscriptions')
    navbind('p', 'https://peer.tube')
    navbind('a', 'https://archlinux.org')
    navbind('e', 'https://ebay.com')
    navbind('r', 'https://reddit.com')
    navbind('m', 'https://protonmail.com/login')
    navbind('g', 'https://gmail.com')
    navbind('f', 'https://facebook.com')
    navbind('s', 'https://soundcloud.com/stream')
    navbind('i', 'https://discordapp.com/channels/@me')
    navbind('b', 'https://bitbucket.org')
    navbind('k', 'https://www.khanacademy.org/')

    config.bind('dnm', 'open -t https://moss-avis.no')
    config.bind('dnn', 'open -t https://www.nrk.no/')
    config.bind('dnv', 'open -t https://www.vg.no/')
    config.bind('dns', 'open -t https://mastodon.social/web/timelines/home')
    config.bind('dnk', 'open -t https://klassekampen.no/')

    config.bind(',s',  'open -t qute://settings')
    config.bind(',S',  'spawn --userscript add_js_entry.py')
    config.bind(',dm', 'hint links spawn mpv {hint-url}')
    config.bind(',dt', 'hint links spawn transmission-remote -a {hint-url}')
    config.bind(',dd', 'hint links spawn youtube-dl -r 800k -o "~/Downloads/%(title)s.%(ext)s" {hint-url}')
    config.bind(',dD', 'spawn youtube-dl -r 800k -o "~/Downloads/%(title)s.%(ext)s" {url}')
    config.bind(',da', 'hint links spawn youtube-dl -r 800k -f bestaudio -o "~/Downloads/%(title)s.%(ext)s" -x --audio-format opus --audio-quality 0 {hint-url}')
    config.bind(',dA', 'spawn youtube-dl -r 800k -f bestaudio -o "~/Downloads/%(title)s.%(ext)s" -x --audio-format opus --audio-quality 0 {url}')
    config.bind(',M',  'spawn mpv {url}')
    config.bind(',D',  'download')
    config.bind(',e',  'spawn --userscript emacspaste')
    config.bind(',p',  'tab-pin')
    config.bind(',f',  'spawn --userscript qute-pass --password-only')

bind()
