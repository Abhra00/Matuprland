# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103
# pylint settings included to disable linting errors

c.colors.statusbar.normal.bg = "#000000"
c.colors.statusbar.command.bg = "#000000"
# c.colors.statusbar.normal.bg = "#000000"
# c.colors.statusbar.command.bg = "#000000"
c.colors.statusbar.command.fg = "#c1c1c1"
c.colors.statusbar.normal.fg = "#ddeecc"
c.colors.statusbar.passthrough.fg = "#ddeecc"
c.colors.statusbar.url.fg = "#9b8d7f"
c.colors.statusbar.url.success.https.fg = "#9b8d7f"
c.colors.statusbar.url.hover.fg = "#aaaaaa"
# c.statusbar.show = "always"

c.colors.tabs.even.bg = "#000000"  # transparent tabs!!
c.colors.tabs.odd.bg = "#000000"
c.colors.tabs.bar.bg = "#00000000"
# c.colors.tabs.even.bg = "#000000"
# c.colors.tabs.odd.bg = "#000000"
c.colors.tabs.even.fg = "#2a2325"
c.colors.tabs.odd.fg = "#2a2325"
c.colors.tabs.selected.even.bg = "#c1c1c1"
c.colors.tabs.selected.odd.bg = "#c1c1c1"
c.colors.tabs.selected.even.fg = "#000000"
c.colors.tabs.selected.odd.fg = "#000000"

c.colors.hints.bg = "#000000"
c.colors.hints.fg = "#c1c1c1"
c.tabs.show = "multiple"

c.colors.completion.item.selected.match.fg = "#ddeecc"
c.colors.completion.match.fg = "#ddeecc"

c.colors.tabs.indicator.start = "#c1c1c1"
c.colors.tabs.indicator.stop = "#505050"
c.colors.completion.odd.bg = "#000000"
c.colors.completion.even.bg = "#000000"
c.colors.completion.fg = "#c1c1c1"
c.colors.completion.category.bg = "#000000"
c.colors.completion.category.fg = "#c1c1c1"
c.colors.completion.item.selected.bg = "#000000"
c.colors.completion.item.selected.fg = "#c1c1c1"

c.colors.messages.info.bg = "#000000"
c.colors.messages.info.fg = "#c1c1c1"
c.colors.messages.error.bg = "#000000"
c.colors.messages.error.fg = "#c1c1c1"
c.colors.downloads.error.bg = "#000000"
c.colors.downloads.error.fg = "#c1c1c1"

c.colors.downloads.bar.bg = "#000000"
c.colors.downloads.start.bg = "#c1c1c1"
c.colors.downloads.start.fg = "#c1c1c1"
c.colors.downloads.stop.bg = "#505050"
c.colors.downloads.stop.fg = "#c1c1c1"

c.colors.tooltip.bg = "#000000"
c.colors.webpage.bg = "#000000"


# c.url.start_pages = ""
# c.url.default_page = ""

c.tabs.title.format = "{audio}{current_title}"
c.fonts.web.size.default = 20

c.url.searchengines = {
# note - if you use duckduckgo, you can make use of its built in bangs, of which there are many! https://duckduckgo.com/bangs
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        '!aw': 'https://wiki.archlinux.org/?search={}',
        '!apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
        '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
        '!yt': 'https://www.youtube.com/results?search_query={}',
        }

c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']

config.load_autoconfig() # load settings done via the gui

c.auto_save.session = True # save tabs on quit/restart

# keybinding changes
config.bind('=', 'cmd-set-text -s :open')
config.bind('h', 'history')
config.bind('cs', 'cmd-set-text -s :config-source')
config.bind('tH', 'config-cycle tabs.show multiple never')
config.bind('sH', 'config-cycle statusbar.show always never')
config.bind('T', 'hint links tab')
config.bind('pP', 'open -- {primary}')
config.bind('pp', 'open -- {clipboard}')
config.bind('pt', 'open -t -- {clipboard}')
config.bind('qm', 'macro-record')
config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
config.bind('tT', 'config-cycle tabs.position top left')
config.bind('gJ', 'tab-move +')
config.bind('gK', 'tab-move -')
config.bind('gm', 'tab-move')

# dark mode setup
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

# styles, cosmetics
# c.content.user_stylesheets = ["~/.config/qutebrowser/styles/youtube-tweaks.css"]
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.indicator.width = 0 # no tab indicators
# c.window.transparent = True # apparently not needed
c.tabs.width = '7%'

# fonts
c.fonts.default_family = []
c.fonts.default_size = '13pt'
c.fonts.web.family.fixed = 'Iosevka-Medium'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'

# privacy - adjust these settings based on your preference
# config.set("completion.cmd_history_max_items", 0)
# config.set("content.private_browsing", True)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", False) # tsh keybind to toggle

# Adblocking info -->
# For yt ads: place the greasemonkey script yt-ads.js in your greasemonkey folder (~/.config/qutebrowser/greasemonkey).
# The script skips through the entire ad, so all you have to do is click the skip button.
# Yeah it's not ublock origin, but if you want a minimal browser, this is a solution for the tradeoff.
# You can also watch yt vids directly in mpv, see qutebrowser FAQ for how to do that.
# If you want additional blocklists, you can get the python-adblock package, or you can uncomment the ublock lists here.
c.content.blocking.enabled = True
# c.content.blocking.method = 'adblock' # uncomment this if you install python-adblock
# c.content.blocking.adblock.lists = [
#         "https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
#         "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"]
