---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "themes/oxocarbon/"

local oxocarbon = {}
oxocarbon.base00      = "#161616" -- default bg
oxocarbon.base01      = "#262626" -- lighter bg
oxocarbon.base02      = "#393939" -- selection bg
oxocarbon.base03      = "#525252" -- comments
oxocarbon.base04      = "#dde1e6" -- dark fg
oxocarbon.base05      = "#f2f4f8" -- default fg
oxocarbon.base06      = "#ffffff" -- light fg
oxocarbon.base07      = "#08bdba" -- light bg
oxocarbon.base08      = "#3ddbd9" -- vars, diff deleted
oxocarbon.base09      = "#78a9ff" -- ints, urls
oxocarbon.base0a      = "#ee5396" -- classes, search bg
oxocarbon.base0b      = "#33b1ff" -- strings, diff inserted
oxocarbon.base0c      = "#ff7eb6" -- escape chars
oxocarbon.base0d      = "#42be65" -- functions, headings
oxocarbon.base0e      = "#be95ff" -- keyworks, diff changed
oxocarbon.base0f      = "#82cfff" -- deprecated


local theme = {}

-- font
theme.font          = "IBM Plex Sans 10"


-- main colors
theme.bg_normal     = oxocarbon.base00
theme.bg_focus      = oxocarbon.base00
theme.bg_urgent     = oxocarbon.base02
theme.bg_minimize   = oxocarbon.base00
theme.bg_systray    = oxocarbon.base00

theme.fg_normal     = oxocarbon.base05
theme.fg_focus      = oxocarbon.base05
theme.fg_urgent     = oxocarbon.base05
theme.fg_minimize   = oxocarbon.base03

theme.useless_gap         = dpi(6)
theme.border_width        = dpi(1)
theme.border_color_normal = oxocarbon.base00
theme.border_color_active = oxocarbon.base00
theme.border_color_marked = oxocarbon.base00

theme.tooltip_bg_color     = oxocarbon.base00
theme.tooltip_fg_color     = oxocarbon.base05

theme.taglist_fg_focus     = oxocarbon.base05
theme.taglist_fg_urgent    = oxocarbon.base03
theme.taglist_fg_occupied  = oxocarbon.base03
theme.taglist_fg_empty     = oxocarbon.base03
theme.taglist_fg_volatile  = oxocarbon.base03

theme.tasklist_bg          = oxocarbon.base00
theme.tasklist_fg_focus    = oxocarbon.base05
theme.tasklist_fg_urgent   = oxocarbon.base05

theme.titlebar_bg_normal   = oxocarbon.base00
theme.titlebar_bg_focus    = oxocarbon.base00
theme.titlebar_fg_normal   = oxocarbon.base03
theme.titlebar_fg_focus    = oxocarbon.base05

theme.hotkeys_modifiers_fg = oxocarbon.base05


-- taglist squares
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, oxocarbon.base05
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, oxocarbon.base03
)


-- menus
theme.menu_submenu_icon = themes_path.."submenu.png"

theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)


-- icons
theme.titlebar_close_button_normal = themes_path.."icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."icons/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."icons/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."icons/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."icons/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."icons/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."icons/titlebar/maximized_focus_active.png"

theme.layout_fairh = themes_path.."icons/layouts/fairhw.png"
theme.layout_fairv = themes_path.."icons/layouts/fairvw.png"
theme.layout_floating  = themes_path.."icons/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."icons/layouts/magnifierw.png"
theme.layout_max = themes_path.."icons/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."icons/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."icons/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."icons/layouts/tileleftw.png"
theme.layout_tile = themes_path.."icons/layouts/tilew.png"
theme.layout_tiletop = themes_path.."icons/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."icons/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."icons/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."icons/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."icons/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."icons/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."icons/layouts/cornersew.png"

-- awesome icon
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = oxocarbon.base08, fg = oxocarbon.base05 }
    }
end)


-- wallpaper
-- theme.wallpaper = themes_path.."icons/background.png"


return theme
