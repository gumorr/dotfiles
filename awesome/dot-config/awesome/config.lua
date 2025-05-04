local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")

-- default apps
local apps = {
	terminal = "kitty",
	editor = os.getenv("EDITOR") or "emacs"
}

-- theme
local theme = gears.filesystem.get_configuration_dir() .. "themes/oxocarbon/theme.lua"

-- bindings
local binds = {
	main_modkey = "Mod4", -- for tab movement, launching apps, etc.
	second_modkey = "Control" -- for window functions
}

-- tags
local tags = {
	{
		name = "term",
		layout = awful.layout.suit.tile,
		screen = 1
	},
	{
		name = "web",
		layout = awful.layout.suit.tile,
		screen = 1
	},
	{
		name = "game",
		layout = awful.layout.suit.max,
		screen = 1
	},
	{
		name = "chat",
		layout = awful.layout.suit.tile,
		screen = 2
	},
    {
        name = "misc",
        layout = awful.layout.suit.tile,
        screen = 1
    },
	{
		name = "misc",
		layout = awful.layout.suit.tile,
		screen = 2
	},


}

-- now we hand all this shit over to everything else
local config = {
	apps = apps,
	theme = theme,
	binds = binds,
	tags = tags
}

return config
