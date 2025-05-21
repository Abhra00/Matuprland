# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103
# pylint settings included to disable linting errors

# Statusbar
c.colors.statusbar.normal.bg = "#15161e"
c.colors.statusbar.command.bg = "#15161e"
c.colors.statusbar.command.fg = "#a9b1d6"
c.colors.statusbar.normal.fg = "#a9b1d6"
c.colors.statusbar.passthrough.fg = "#a9b1d6"
c.colors.statusbar.url.fg = "#7aa2f7"
c.colors.statusbar.url.success.https.fg = "#7aa2f7"
c.colors.statusbar.url.hover.fg = "#c0caf5"

# Tabs
c.colors.tabs.even.bg = "#15161e"
c.colors.tabs.odd.bg = "#15161e"
c.colors.tabs.bar.bg = "#15161e"
c.colors.tabs.even.fg = "#414868"
c.colors.tabs.odd.fg = "#414868"
c.colors.tabs.selected.even.bg = "#c0caf5"
c.colors.tabs.selected.odd.bg = "#c0caf5"
c.colors.tabs.selected.even.fg = "#15161e"
c.colors.tabs.selected.odd.fg = "#15161e"
c.colors.tabs.indicator.start = "#a9b1d6"
c.colors.tabs.indicator.stop = "#414868"

# Hints
c.colors.hints.bg = "#15161e"
c.colors.hints.fg = "#a9b1d6"

# Completion
c.colors.completion.item.selected.match.fg = "#9ece6a"
c.colors.completion.match.fg = "#9ece6a"
c.colors.completion.odd.bg = "#15161e"
c.colors.completion.even.bg = "#15161e"
c.colors.completion.fg = "#a9b1d6"
c.colors.completion.category.bg = "#15161e"
c.colors.completion.category.fg = "#a9b1d6"
c.colors.completion.item.selected.bg = "#414868"
c.colors.completion.item.selected.fg = "#c0caf5"

# Messages
c.colors.messages.info.bg = "#15161e"
c.colors.messages.info.fg = "#a9b1d6"
c.colors.messages.error.bg = "#15161e"
c.colors.messages.error.fg = "#f7768e"

# Downloads
c.colors.downloads.error.bg = "#15161e"
c.colors.downloads.error.fg = "#f7768e"
c.colors.downloads.bar.bg = "#15161e"
c.colors.downloads.start.bg = "#9ece6a"
c.colors.downloads.start.fg = "#15161e"
c.colors.downloads.stop.bg = "#414868"
c.colors.downloads.stop.fg = "#a9b1d6"

# Tooltip
c.colors.tooltip.bg = "#15161e"
c.colors.tooltip.fg = "#a9b1d6"

# Webpage background
c.colors.webpage.bg = "#15161e"

# Tabs visibility
c.tabs.show = "multiple"

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
c.fonts.default_family = ['Iosevka Nerd Font']
c.fonts.default_size = '13pt'
c.fonts.web.family.fixed = 'monospace'
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
